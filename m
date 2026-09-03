Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397CC624D6
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 03:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=; b=xUZ/6WU9lY0YXG0ySrdxDcFxjA
	PAstnuJ+5bMz2C0oNPYEKmsXqzhLdip/gbFXhBVqRCEotpPfHfTWszt3D3S3InIwIxKNrg2N7crUt
	KTviuJASpBk8D9T6/eah0+zb+0x4ygi0xs3Xl41WpfUDg7NOxJEiFkISX+kT9r8TsCtr5w27n8GDJ
	KMOpxfPHViDPLspNz6+SMtQ/hElkiQZwJl3gJQ7HVnSDLeLtISN/8H4XZvRVVu56dgYt83hVR74E8
	uJl/CWXDesmix3R4vdQmiJJeNB1hQISm66lrLXcsl0KUX7ubT6DAG0oioX/UC3iUtZzcCI709lL7O
	lSSCcgSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xne-0000000GFmK-2OHX;
	Thu, 03 Sep 2026 03:07:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1xnb-0000000GFlq-3y6o
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 03:07:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6832xi5Z3657552
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 03:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=; b=Qz95Lv7k3vn/x5po
	jdbiHdF9u74ERYqObAg3IK0X3jRhM01ols52vfqhm6hW9dZi3YmDUJmQUfGB673v
	g0flqSfvoVpdhvFHkogd+FMqjXt2may8VNZRphYQZMVIUgMCx0AG2Y7iSludmzn0
	odzAZHAH5mvNlZPMEJBIXPDbA/HKP0gZlKWrHoyWTp/uomF2Z+TA7N+VmsCyBPEd
	HhJi79z/ZhbZ5ZBzlLHr3bof140oVlnI9+GK0L8mlV3Et1qQWWK0nTdBByO0xeeT
	Tx3YPvubOjm2R5eCoJKZUn9pFDYKsh8jw/04yn1L6rKNjHbSFhDvIjVBeh+PjsEe
	VJbIrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjhb3n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 03:07:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so1896573a12.2
        for <ath12k@lists.infradead.org>; Wed, 02 Sep 2026 20:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788404853; x=1789009653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=;
        b=GuO8Zn2o80i26YHuJAFNL62zmIilbOCaWfwd93s8bh2WIYr4Zmy2hm87BS2xZD97Jf
         RsARYAI2h30+nwXiuYofZ88GhwBerX58+NqVsc0/UofjOZca06VcIWD+blOgVNYZfayJ
         dg80JjRlDkEjYBaXUB372CIXxXLEIfOibgyXzEG9/E2P8XBPYQ61I4iDno88sIOGI6Kd
         xAAtFKmmIKA0Dvyuvv26BUFNZvjxtSJCAtMEIRv/7eNy9NsAmKmp+UqfAnY6Atrobzl/
         wmS1AyFCDDUr+ZWA3s2MiyRuCAjCKvIKnoIIHXdrwMhHatZ/Vkpn3G1pygHnjcy48sJS
         TjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404853; x=1789009653;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dkUpL4IwUW3ZUTI7y6UDzwrF1aRbG8miuQ1bitA8zM=;
        b=bXGMKYxpQL8/sdxjLrJTxa+Su+oa2lX5BBAtSPXDp+n+XxJZ9AMHJpOfJofF0L0uie
         xVdMEIF8ctuXZpnYfB8LdtIA05ySROogW7sbCHd73AtG1jXtKcOBIaQXyGhPsl6x4546
         DU9rwHTienJjCNJMNlQLcB0LbTXf8DSIrVAzWOvtSQWCG56KT9pGsWcNfqeIEfyZJ49I
         oBBIM5joDFJT9LDRVI04m0mmN80UDTVE4V6a0AtXTmjLPpfYrt8FFY9UqLwpwQgdO7hT
         R523DMIYYuy5xVt5qjAzuZeFBnkFY8STBMTj7jKq5ZoThKsVpnwKWyq5YTjAOxNDn1KG
         ZqIQ==
X-Gm-Message-State: AFuF++mdfa4nXSJxeyJcv/Eru7l32kuTfqf0mRttbujo1ma/XxwcvNoA
	TxWCCwFhM4RDm+rbQupBnA9wbiy3PsZ+5tUxFzjSUJlnjkXbpk3219APivAweTcpU7al4FYhXCl
	H1jhiX8n63SL85uxuaDzArD2Y9gljPlswFdszVYVUg5LW5zIJ9PdAmHn30ggJ7sjK
X-Gm-Gg: AYBFou1eRHBk0hkOA3VfFpfIiF2z0Gj7WmBYlmSKIcAmFcP5kmA0wF+bxI8JAiwn2K2
	o1VY0OqRKfzRcpajFX7e8OHqZJ/FG+heu+rofKkYjQhKgDRlDyHqIdnDOZ9ylbHDrRvKjQZbfff
	cda6FLC8bfgYIj9mXp445cfwCaGzYvu7Xsy0cMlOlWNmxClGl9UAT1pvSxtLDmoViH4Ig3liRmD
	QbAdugZJUNGl3w7ToL5Muu8k735rJ5bjiviTUd5C8ipDH87GbVLG4DOalX25xkBZeoKLSEjKsBQ
	nHOoVickLJyS2IUao0182afoiyL31BtY7XzFWp2hM8hyl7lkMWirFJe2Dy2VMboxJkpAauh+zdA
	zvhP8UhNia2uIR15+z4sVsrgVIyxM8DEP11LZH17jIIiX4zdJ+JU6GuB1X+N+Q/zDdlwHkL9q
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12149930b3a.12.1788404853431;
        Wed, 02 Sep 2026 20:07:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e9c:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-85ed3c7d861mr12149882b3a.12.1788404852906;
        Wed, 02 Sep 2026 20:07:32 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003a82bsm2078731b3a.33.2026.09.02.20.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 20:07:32 -0700 (PDT)
Message-ID: <265ee3ce-b953-4cef-a34e-c2f51a86ec26@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:07:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: flush REO queue extension descriptors
 before freeing the qdesc
To: Sebastian Salmhofer <sebastian.salmhofer@salmtek.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831151011.2336305-1-sebastian.salmhofer@salmtek.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831151011.2336305-1-sebastian.salmhofer@salmtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DXfDro5A6oYk5OKFVRy7WnuN5ivCVI4T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX7nmDYWvuhO5u
 EfG+8NPvC1OTn0KudJjy308fwqCg0BAfrT2IPBabDxrG7Dk/K8uw6cSTuEcv3+33bnPWVPs5/NO
 j973LNM4zF2tsjJZpT1m0QKkmsBU6rM0J8YCrBFHMUm58QzgEmK9G3marCwPczdrw4HSZgCgzKl
 OyYUtEFfP8c/Y4Cbvsm+4zZbYGXv7aSadX7lhPpVb1IiKttP14xYSA6wTb/KYOXutuveUvVvivz
 fkRYzIyIz4E5Oz/GNBoC9hQV+PiNAmoE7weEviaJl7MkYWeHLbsT3fZ7wzOwWoDgd2f2Mq7kU4q
 LsvPCZ+39ZllSqiXGQf1FO+mT/QBiQ2cGvnkMsRVypDrDvhdhPAqz5IwnoyKl1p2ZXRIY99BzOe
 NYT+ouLJkzIy+Vq4/ruzHHflU/B5Sql7px1EP2LZSinlZCN56LBhNxebN2udDe0TGqPpO7Wb3S2
 MkyOOUd51xSJ/rcBjEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDAyNiBTYWx0ZWRfX3OA98ru3DvE5
 WkAY51D9jxUcwzL2aJ6uHYMXv3RIg4Nu/y73PI3AtnXaAWd15ksJ7IHmS/nXtZTEvlSaIvIaSHI
 yt5UKFsXERzXzhbLPuEw8KCE6EP+BUY=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a98e476 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=urdA6OnrAAAA:8 a=zcs0KYa2kuF-uyBAxWkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=vQ8IPYms0FRTZDs_xDyb:22
X-Proofpoint-ORIG-GUID: DXfDro5A6oYk5OKFVRy7WnuN5ivCVI4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_01,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_200736_110026_F0C68679 
X-CRM114-Status: GOOD (  30.95  )
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



On 8/31/2026 11:10 PM, Sebastian Salmhofer wrote:
> Since commit b706fb4e580b ("wifi: ath12k: Use 1KB Cache Flush Command
> for QoS TID Descriptors") a QoS TID RX queue descriptor is retired with
> a single FLUSH_CACHE command carrying FLUSH_QUEUE_1K_DESC. On QCN9274
> that command does not cover the extension descriptors that follow the
> queue descriptor in the same 1536-byte allocation. Those hold the MPDU
> link pointers and are written by REO on every enqueue and dequeue, so
> they are frequently dirty in the REO cache when the TID is deleted.
> 
> After the qdesc is unmapped and freed, the REO cache controller later
> evicts the stale extension lines and writes them back to the old DMA
> address. On a host with the IOMMU enabled this shows up as a burst of
> AMD-Vi IO_PAGE_FAULT write events at 128-byte spacing, e.g.
> 
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a100 flags=0x0020]
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a180 flags=0x0020]
>   ...
>   AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0038 address=0xf6e7a580 flags=0x0020]
> 
> The faulting addresses always fall at offsets 0x100..0x580 of a
> retired qdesc and never at 0x000 or 0x080, i.e. exactly the ten
> extension descriptors and never the queue descriptor or the 1K bitmap

the queue desc offset should be 0x000, and the offset of the first extension descriptor
should at 0x080. However the IOMMU warning starts at 0x100, which does not make sense ...

> descriptor. The writes are triggered by later REO activity, typically
> a new station association, so they can occur minutes or hours after the
> memory was freed, and the blocked transactions stall the data path for
> several seconds.

then what happens? the new sta association succeeds?
> Without an IOMMU the same writes silently corrupt
> whatever now occupies that memory.
> 
> Restore the per-segment flush of every 128-byte line above the queue
> descriptor, as ath11k still does, before issuing the base flush with
> FLUSH_QUEUE_1K_DESC and NEED_STATUS. REO commands execute in order, so
> the status of the final base flush also confirms the preceding segment
> flushes have completed, and the qdesc is still only freed from that
> completion. A send failure in the sequence leaves the descriptor on the
> retirement list for retry, as before.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Fixes: b706fb4e580b ("wifi: ath12k: Use 1KB Cache Flush Command for QoS TID Descriptors")
> Signed-off-by: Sebastian Salmhofer <sebastian.salmhofer@salmtek.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c | 39 ++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -225,22 +225,43 @@
>  				    struct ath12k_dp_rx_tid_rxq *rx_tid)
>  {
>  	struct ath12k_hal_reo_cmd cmd = {};
> +	dma_addr_t paddr = rx_tid->qbuf.paddr_aligned;
> +	u32 off = rx_tid->qbuf.size;
>  	int ret;
>  
> -	cmd.addr_lo = lower_32_bits(rx_tid->qbuf.paddr_aligned);
> -	cmd.addr_hi = upper_32_bits(rx_tid->qbuf.paddr_aligned);
> +	/* The REO cache controller caches the queue descriptor and each
> +	 * 128-byte extension descriptor as separate objects, and a
> +	 * FLUSH_CACHE command only addresses one of them. FLUSH_QUEUE_1K_DESC
> +	 * extends the base flush to the 1K-window descriptor but does not
> +	 * cover the extension descriptors, so flush those explicitly first.
> +	 * The command ring executes in order, hence the final base flush
> +	 * status also confirms the extension flushes have completed.
> +	 */
> +	while (off > HAL_LINK_DESC_ALIGN) {
> +		off -= HAL_LINK_DESC_ALIGN;
> +		memset(&cmd, 0, sizeof(cmd));

unnecessary cleanup since all required fields are refilled in each iteration.

> +		cmd.addr_lo = lower_32_bits(paddr + off);
> +		cmd.addr_hi = upper_32_bits(paddr + off);
> +		ret = ath12k_wifi7_dp_reo_cmd_send(ab, rx_tid,
> +						   HAL_REO_CMD_FLUSH_CACHE,
> +						   &cmd, NULL);
> +		if (ret) {
> +			ath12k_warn(ab,
> +				    "failed to send FLUSH_CACHE for tid %d offset 0x%x: %d\n",
> +				    rx_tid->tid, off, ret);
> +			return ret;
> +		}
> +	}
> +
> +	memset(&cmd, 0, sizeof(cmd));

also unnecessary

> +	cmd.addr_lo = lower_32_bits(paddr);
> +	cmd.addr_hi = upper_32_bits(paddr);
>  	/* HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS - all pending MPDUs
> -	 *in the bitmap will be forwarded/flushed to REO output rings
> +	 * in the bitmap will be forwarded/flushed to REO output rings
>  	 */
>  	cmd.flag = HAL_REO_CMD_FLG_NEED_STATUS |
>  		   HAL_REO_CMD_FLG_FLUSH_FWD_ALL_MPDUS;
>  
> -	/* For all QoS TIDs (except NON_QOS), the driver allocates a maximum
> -	 * window size of 1024. In such cases, the driver can issue a single
> -	 * 1KB descriptor flush command instead of sending multiple 128-byte
> -	 * flush commands for each QoS TID, improving efficiency.
> -	 */
> -
>  	if (rx_tid->tid != HAL_DESC_REO_NON_QOS_TID)
>  		cmd.flag |= HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC;

HAL_REO_CMD_FLG_FLUSH_QUEUE_1K_DESC is used to flush all in a single cmd. since we switch
back to the per segment flush, do we still need it?

>  
> --
> 2.47.0
> 
> 


