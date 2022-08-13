From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 12 Aug 2022 17:16:10 -0700
Subject: [PATCH 06/50] wifi: ath12k: add core.h
In-Reply-To: <20220812161003.27279-7-kvalo@kernel.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-7-kvalo@kernel.org>
Message-ID: <f0c1dad2-cb69-cc7e-5cc8-892b4a3fa9d9@quicinc.com>
List-Id: <ath12k.lists.infradead.org>
To: ath12k@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


> +struct ath12k_skb_cb {
> +	dma_addr_t paddr;
> +	u8 flags;
> +	u32 cipher;
> +	struct ath12k *ar;
> +	struct ieee80211_vif *vif;
> +	dma_addr_t paddr_ext_desc;
> +} __packed;

Usage of __packed seems incorrect since this is not an ABI buffer, and 
packing will potentially result in some members being unaligned (ath11k 
has struct ath11k_skb_cb packed as well).

Suggest removing __packed and using pahole to find the ideal layout 
since the only concern is that this does not exceed 
IEEE80211_TX_INFO_DRIVER_DATA_SIZE

