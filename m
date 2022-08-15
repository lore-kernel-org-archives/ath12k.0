From: Ping-Ke Shih <pkshih@realtek.com>
Date: Mon, 15 Aug 2022 01:56:29 +0000
Subject: [PATCH 12/50] wifi: ath12k: add dp.h
In-Reply-To: <20220812161003.27279-13-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-13-kvalo@kernel.org>
Message-ID: <0eabd6c1b3ca4d8a8152ad5b4f3efee6@realtek.com>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Kalle Valo <kvalo@kernel.org>
> Sent: Saturday, August 13, 2022 12:09 AM
> To: linux-wireless at vger.kernel.org
> Cc: ath12k at lists.infradead.org
> Subject: [PATCH 12/50] wifi: ath12k: add dp.h
> 
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.h | 2017 ++++++++++++++++++++++++++++++++++
>  1 file changed, 2017 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> new file mode 100644
> index 000000000000..cf9610dffbb8
> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath12k/dp.h

[...]

> +
> +struct htt_srng_setup_cmd {
> +	u32 info0;
> +	u32 ring_base_addr_lo;
> +	u32 ring_base_addr_hi;
> +	u32 info1;
> +	u32 ring_head_off32_remote_addr_lo;
> +	u32 ring_head_off32_remote_addr_hi;
> +	u32 ring_tail_off32_remote_addr_lo;
> +	u32 ring_tail_off32_remote_addr_hi;
> +	u32 ring_msi_addr_lo;
> +	u32 ring_msi_addr_hi;
> +	u32 msi_data;
> +	u32 intr_info;
> +	u32 info2;
> +} __packed;
> +

Should they be '__le32' instead of 'u32'?

This struct is used to fill data of ath12k_htc_send(), and the fields of
htc header are __le32: 

struct ath12k_htc_hdr {
	__le32 htc_info;
	__le32 ctrl_info;
} __packed __aligned(4);

If above is correct, some struct(s) related to ath12k_htc_send() have similar problems: 
struct htt_ver_req_cmd
struct htt_ppdu_stats_cfg_cmd
struct htt_rx_ring_selection_cfg_cmd
struct htt_ext_stats_cfg_cmd
struct htt_tx_ring_selection_cfg_cmd  (miss __packed)

--
Ping-Ke


