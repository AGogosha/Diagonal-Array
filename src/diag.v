module diag

pub fn diag_ones(m int, n int, k int) []f64 {
	mut array_out := []f64{len: m * n, cap: m * n, init: 0.0}
	if 0 <= k {
		for i in 0 .. n {
			if i + k < m {
				array_out[i * m + i + k] = 1
			}
		}
	} else {
		for i in -k .. m - k {
			if i * m + i + k < n * m {
				array_out[i * m + i + k] = 1
			}
		}
	}

	return array_out
}

pub fn diag_arb(m int, n int, k int, values []f64) []f64 {
	mut array_out := []f64{len: m * n, cap: m * n, init: 0.0}
	/*
	need to inclues an error for if there are fever values in values than diagonal elements
	*/
	if 0 <= k {
		for i in 0 .. n {
			if i + k < m {
				array_out[i * m + i + k] = values[i]
			}
		}
	} else {
		for i in -k .. m - k {
			if i * m + i + k < n * m {
				array_out[i * m + i + k] = values[i-1]
			}
		}
	}

	return array_out
}
