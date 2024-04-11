Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F885CD1284
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 09:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9jg/3+OGwpMsFovVsQFFIYyxCp7g+7VDOtuGV3MWUC8=; b=s6zVGwbd3dpEP5YT+B9/Wq9GV4
	tR0A42zO/MGyD2Sd1P4CYxWNrNcb3N7De6qDjZp7aIVBTTPILaUJXmkafeJ2dWYk1h0Ln8rEjNOn8
	0Taz++WXasXL2H3E9qvardpgdD+8/pO89s7zblwiFBPwQcBoVus5E0wlSHwos3Bi6XIHdGYP1UnA/
	oASn2eao49TMhs/qdy/EtOQNCua785sh03mR8PQDu7ScW8KJEVR203nerP0mpINS7mghFN/W5ypL0
	7ZpC2W21AOYcUozPVxX42QbOskVVkfIHh4UQmSAXJeLLwnIKbvTwlLG954vhkD83wL/YWTAvGr3iD
	86wVRyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqoY-0000000BLQa-3mlm
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 09:33:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqoV-0000000BLPb-2m3m
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 09:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87E7B62018;
	Thu, 11 Apr 2024 09:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30AD3C433C7;
	Thu, 11 Apr 2024 09:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712828026;
	bh=GC/DqxxpBatPJlbqgZHWoWw7lyNi3WC7bo6SMvypFWI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TWp11hQBIcK/D7zoJPeOyF/lbX6o8+Xcd1V7+Nway/wtKbOrs0aNuqqTcdo5fWbUM
	 mEw9YbZKD9r7dy2JMU4VbcYeVF4LUtDR0UdfuBHMOzz/7COYtMIdVNvQ/BEHpid1tJ
	 LJ3Ep6/swo9/yQ20ugkYlhbNFa3RJO+RE1FBmGkUiX8Kab9/B8i+9NHUjPtTIQ3qKZ
	 SG60oDBwondLc5763eTp8VAXoHEHGuyirqZXZU7pn1TFdE97UB+XfuiF3jWHpVw0sn
	 vPn/S7oaJJ7LmGtUT4IfhiQMcKviePzjz+zjkgZeG4XL5z2CLXNtCZr7IoSpoKPE8J
	 XAG54QhMC0Rpg==
From: Kalle Valo <kvalo@kernel.org>
To: Nithyanantham P <quic_nithp@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: fix mac id extraction when MSDU
 spillover in rx error path
References: <20240329092432.873710-1-quic_nithp@quicinc.com>
Date: Thu, 11 Apr 2024 12:33:43 +0300
In-Reply-To: <20240329092432.873710-1-quic_nithp@quicinc.com> (Nithyanantham
	P.'s message of "Fri, 29 Mar 2024 14:54:32 +0530")
Message-ID: <87bk6gz1jc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_023347_893256_67B816AB 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Nithyanantham P <quic_nithp@quicinc.com> writes:

> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>
> Currently, in the rx error data path, mac id is extracted from the
> last 64bits of MSDU end description tag for each entry received in
> the WBM error ring. Then, each entry will be updated into the MSDU
> list for further processing. The extracted mac id is valid when a
> single MSDU is not fragmented and received in the WBM error ring.
>
> In scenarios where the size of a single MSDU received exceeds the
> descriptor buffer size, resulting in fragmented or spillover MSDU
> entries into the WBM error ring. In this case, the extracted mac id
> from each spillover entry is invalid except the last spillover entry
> of the MSDU. This invalid mac id leads to packet rejection.
>
> To address this issue, check if the MSDU continuation flag is set,
> then extract the valid mac id from the last spillover entry.
> Propagate the valid mac id to all the spillover entries of the single
> MSDU in the temporary MSDU list(scatter_msdu_list). Then, update this
> into the MSDU list (msdu_list) for further processing.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Nithyanantham P <quic_nithp@quicinc.com>

[...]

> @@ -3807,16 +3816,50 @@ int ath12k_dp_rx_process_wbm_err(struct ath12k_base *ab,
>  			continue;
>  		}
>  
> +		msdu_data = (struct hal_rx_desc *)msdu->data;
>  		rxcb->err_rel_src = err_info.err_rel_src;
>  		rxcb->err_code = err_info.err_code;
> -		rxcb->rx_desc = (struct hal_rx_desc *)msdu->data;
> -
> -		__skb_queue_tail(&msdu_list, msdu);
> -
>  		rxcb->is_first_msdu = err_info.first_msdu;
>  		rxcb->is_last_msdu = err_info.last_msdu;
>  		rxcb->is_continuation = err_info.continuation;
> +		rxcb->rx_desc = msdu_data;
> +
> +		if (err_info.continuation) {
> +			__skb_queue_tail(&scatter_msdu_list, msdu);
> +		} else {
> +			mac_id = ath12k_dp_rx_get_msdu_src_link(ab,
> +								msdu_data);
> +			if (mac_id >= MAX_RADIOS) {
> +				dev_kfree_skb_any(msdu);
> +
> +				/* In any case continuation bit is set
> +				 * in the previous record, cleanup scatter_msdu_list
> +				 */
> +				ath12k_dp_clean_up_skb_list(&scatter_msdu_list);
> +				continue;
> +			}
> +
> +			if (!skb_queue_empty(&scatter_msdu_list)) {
> +				struct sk_buff *msdu;
> +
> +				skb_queue_walk(&scatter_msdu_list, msdu) {
> +					rxcb = ATH12K_SKB_RXCB(msdu);
> +					rxcb->mac_id = mac_id;
> +				}
> +
> +				skb_queue_splice_tail_init(&scatter_msdu_list,
> +							   &msdu_list);
> +			}
> +
> +			rxcb = ATH12K_SKB_RXCB(msdu);
> +			rxcb->mac_id = mac_id;
> +			__skb_queue_tail(&msdu_list, msdu);
> +		}
>  	}

The else branch can be avoided with continue. I did that in the pending
branch, please check my changes:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6c677d91adad4817e7f6ef65a85331f52f0237ee

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

