From: Ping-Ke Shih <pkshih@realtek.com>
Date: Mon, 15 Aug 2022 06:09:40 +0000
Subject: [PATCH 31/50] wifi: ath12k: add mac.c
In-Reply-To: <20220812161003.27279-32-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-32-kvalo@kernel.org>
Message-ID: <c9c4f3027e294e148bd595e3db1a62a8@realtek.com>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Saturday, August 13, 2022 12:10 AM
> To: linux-wireless at vger.kernel.org
> Cc: ath12k at lists.infradead.org
> Subject: [PATCH 31/50] wifi: ath12k: add mac.c
> 
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 7054 +++++++++++++++++++++++++++++++++
>  1 file changed, 7054 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> new file mode 100644
> index 000000000000..2ccbd83dc9ca
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -0,0 +1,7054 @@

[...]

> +
> +static int get_num_chains(u32 mask)
> +{
> +	int num_chains = 0;
> +
> +	while (mask) {
> +		if (mask & BIT(0))
> +			num_chains++;
> +		mask >>= 1;
> +	}
> +
> +	return num_chains;
> +}

use hweight32()?

--
Ping-Ke


