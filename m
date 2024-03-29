Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177E8CD128A
	for <ath12k@archiver.kernel.org>; Sun, 31 Mar 2024 16:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qvb6uEI0xknJuqDpXBSOhqtawP0ALfEnbLGvBrR7ic0=; b=gFOzrkbaVMyM33/XHsg2XsWT3O
	JmSXwbYesVWDKdOa7wG1WynJWuKKecX/hdeWOWDVsls1pSCnAZb6Uv61fROEX2mxkkM3uUczOPrgv
	JuUlf0YhBFG7L4+9KlDmtch0F2Fm2i2r1bQo8S6nAhgsKC+vendrvhvmzc6akGIEqwyW9xLI+5iKE
	tPH/a8bt1mK5XvHWAMdr38445i+wKKH0BHGd46bfyMC+G6BLzdOEJEBhbpNHWWzH3ef/zm1FuCELk
	nZqPEkPD96wZHbIwVgeWGeX9DTI3UPzqdQGsF3xwJEEsriJYm4nw72nATRE5P//Fm2g3QgKQ6ni/9
	wI2d9fmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyH9-00000005o63-1sdq
	for ath12k@archiver.kernel.org;
	Sun, 31 Mar 2024 16:43:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyH6-00000005o2x-0tph
	for ath12k@bombadil.infradead.org;
	Sun, 31 Mar 2024 16:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:List-Unsubscribe:
	List-Subscribe:List-Id:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description; bh=qvb6uEI0xknJuqDpXBSOhqtawP0ALfEnbLGvBrR7ic0=; b=l2Aon
	7dCm+usLLF++QRY+JnB+GvrDmZuhdjOs30h5mkX4fvwViwu05MSJf9Euibn4FcW8l6vBw8RFrKF8P
	8WS6X73VyewAnCK6Hg5efcAoVyEVYGH4pLy80SMGZluhqtq7UevJd+TBSp4O8BoA1nVodUnnrcvKn
	63EnuPe8yCuZPixuvK553kI5OkOrZ5yockfLPfCVGPiARgi29s2SZy0VqhA3hbF+dP+26a0XMm50B
	fxjSPyZ2ubTjJcU1VXVx/IEPKjBDiSG4u908gjR8cZXOZ2FYBJ9SLm4jXgNSaFydILgGEbTbqDOj7
	dvYoJPTB+aEsSUpkuLjnjky61j7yQ==;
Received: from a.mx.secunet.com ([62.96.220.36])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqyH2-00000002dtN-18ct
	for ath12k@lists.infradead.org;
	Sun, 31 Mar 2024 16:43:14 +0000
Received: from localhost (localhost [127.0.0.1])
	by a.mx.secunet.com (Postfix) with ESMTP id 26C7E20851;
	Sun, 31 Mar 2024 18:43:11 +0200 (CEST)
X-Virus-Scanned: by secunet
Received: from a.mx.secunet.com ([127.0.0.1])
	by localhost (a.mx.secunet.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5CYVuFsZQwLs; Sun, 31 Mar 2024 18:43:10 +0200 (CEST)
Received: from mailout2.secunet.com (mailout2.secunet.com [62.96.220.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by a.mx.secunet.com (Postfix) with ESMTPS id A8B60208B7;
	Sun, 31 Mar 2024 18:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 a.mx.secunet.com A8B60208B7
Received: from cas-essen-01.secunet.de (unknown [10.53.40.201])
	by mailout2.secunet.com (Postfix) with ESMTP id 9B9BF800060;
	Sun, 31 Mar 2024 18:43:09 +0200 (CEST)
Received: from mbx-essen-01.secunet.de (10.53.40.197) by
 cas-essen-01.secunet.de (10.53.40.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 18:43:09 +0200
Received: from Pickup by mbx-essen-01.secunet.de with Microsoft SMTP Server id
 15.1.2507.17; Sun, 31 Mar 2024 16:36:39 +0000
X-sender: <linux-wireless+bounces-5625-peter.schumann=secunet.com@vger.kernel.org>
X-Receiver: <peter.schumann@secunet.com>
 ORCPT=rfc822;peter.schumann@secunet.com;
 X-ExtendedProps=BQAMAAIAAAUAWAAXAEgAAACdOWm+FoEIR7KnWe1lIx8pQ049U2NodW1hbm4gUGV0ZXIsT1U9VXNlcnMsT1U9TWlncmF0aW9uLERDPXNlY3VuZXQsREM9ZGUFAGwAAgAADwA2AAAATWljcm9zb2Z0LkV4Y2hhbmdlLlRyYW5zcG9ydC5NYWlsUmVjaXBpZW50LkRpc3BsYXlOYW1lDwAPAAAAU2NodW1hbm4sIFBldGVyBQA8AAIAAAUAHQAPAAwAAABtYngtZXNzZW4tMDEFAA4AEQAuyVP5XtO9RYbNJlr9VbVbBQALABcAvgAAAEOSGd+Q7QVIkVZ3ffGxE8RDTj1EQjQsQ049RGF0YWJhc2VzLENOPUV4Y2hhbmdlIEFkbWluaXN0cmF0aXZlIEdyb3VwIChGWURJQk9IRjIzU1BETFQpLENOPUFkbWluaXN0cmF0aXZlIEdyb3VwcyxDTj1zZWN1bmV0LENOPU1pY3Jvc29mdCBFeGNoYW5nZSxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPXNlY3VuZXQsREM9ZGUFABIADwBgAAAAL289c2VjdW5ldC9vdT1FeGNoYW5nZSBBZG1pbmlzdHJhdGl2ZSBHcm91cCAoRllESUJPSEYyM1NQRExUKS9jbj1SZWNpcGllbnRzL2NuPVBldGVyIFNjaHVtYW5uNWU3BQBHAAIAAAUARgAHAAMAAAAFAEMAAgAABQAWAAIAAAUAagAJAAEAAAAAAAAABQAVABYAAgAAAA8ANQAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRGlyZWN0b3J5RGF0YS5Jc1Jlc291cmNlAgAABQAUABEAnTlpvhaBCEeyp1ntZSMfKQUAIwACAAEFACIADwAxAAAAQXV0b1Jlc3BvbnNlU3VwcHJlc3M6IDANClRyYW5zbWl0SGlzdG9yeTogRmFsc
	2UNCg8ALwAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuRXhwYW5zaW9uR3JvdXBUeXBlDwAVAAAATWVtYmVyc0dyb3VwRXhwYW5zaW9uBQAmAAIAAQ==
X-CreatedBy: MSExchange15
X-HeloDomain: b.mx.secunet.com
X-ExtendedProps: BQBjAAoAfEemlidQ3AgFAGEACAABAAAABQA3AAIAAA8APAAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuTWFpbFJlY2lwaWVudC5Pcmdhbml6YXRpb25TY29wZREAAAAAAAAAAAAAAAAAAAAAAAUASQACAAEFAAQAFCABAAAAGgAAAHBldGVyLnNjaHVtYW5uQHNlY3VuZXQuY29tBQAGAAIAAQ8AKgAAAE1pY3Jvc29mdC5FeGNoYW5nZS5UcmFuc3BvcnQuUmVzdWJtaXRDb3VudAcAAwAAAA8ACQAAAENJQXVkaXRlZAIAAQUAAgAHAAEAAAAFAAMABwAAAAAABQAFAAIAAQUAYgAKAIMAAADMigAABQBkAA8AAwAAAEh1YgUAKQACAAEPAD8AAABNaWNyb3NvZnQuRXhjaGFuZ2UuVHJhbnNwb3J0LkRpcmVjdG9yeURhdGEuTWFpbERlbGl2ZXJ5UHJpb3JpdHkPAAMAAABMb3c=
X-Source: SMTP:Default MBX-ESSEN-02
X-SourceIPAddress: 62.96.220.37
X-EndOfInjectedXHeaders: 18253
X-Virus-Scanned: by secunet
Received-SPF: Pass (sender SPF authorized) identity=mailfrom; client-ip=139.178.88.99; helo=sv.mirrors.kernel.org; envelope-from=linux-wireless+bounces-5625-peter.schumann=secunet.com@vger.kernel.org; receiver=peter.schumann@secunet.com 
DKIM-Filter: OpenDKIM Filter v2.11.0 b.mx.secunet.com C3540200BB
Authentication-Results: b.mx.secunet.com;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hbIgZ9gg"
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hbIgZ9gg"
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711748089; cv=none; b=gIJMsukTcHGi2ooVJQk82VQfFea98KueCFXc+3PMd+bSARSjm/I5MGOdEUDdfcf9uJbEY2Ob5vmiciT55DxKK2va64tPOuPJS74EkcvpFfjBdMrOH/Y4ZJE/BvqbJXeOs3X7ZEBRx8d6nLNiJdsSpscmrphaQU68mp4nuBMb+Ds=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711748089; c=relaxed/simple;
	bh=xkHjr+s2F9V96bJBi9kgJ17oPEwDnvI5h2kmwnLcZ8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dTfmv5DMXujWDSl3vyHwVXMJF+bbMZ92LrZcDSSnv0DCJzl5G8oI4Oe2K5OrAeKxZ+cgOsZhJg2D+w/cNw0UhXjvNJO3YKsDvy8ttvasgLiP1VkMBB1Md41Fv38YJb+I0mdg2qzS2cFmq9K5z2bxas8uO2SVIPuNZIIU878W8CE=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hbIgZ9gg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qvb6uEI0xknJuqDpXBSOhqtawP0ALfEnbLGvBrR7ic0=; b=hb
	IgZ9ggvEHs/gX8O2mNXDz5ee86qlMI0wVCA93JOdm19u2U1XzpqERh4zMR7NVQqN
	uIZfF++NYIHRToJ1sDUG7aMrZV9gWoPqwjGVvsy5hMWlp1mUSvHDP/6UxO+Toa3E
	EXZrYnRd8He/ReiZ44SLtRGZtli2haOzgyGPx/W/k9EuNUUzH1OTPr3+DSkpxx55
	ZQEJf8kc9sdcMR6w/eY7HAOyeaC6ngdbvdCE7TToSW5d/aMpf0Zv3s6iLiBNMn+Y
	Z12Snf1HJJ2AL6D1zovhJKycr7PlM0JYgaEDnjOrHs7sTyZ2YyYFXIiwk9A9FUqW
	F63zYXfhKH6vlhtot+8Q==
Message-ID: <a217c752-65fb-4975-8208-c708a0ceeab8@quicinc.com>
Date: Fri, 29 Mar 2024 14:34:41 -0700
Precedence: bulk
X-Mailing-List: linux-wireless@vger.kernel.org
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
 <20240327170910.23975-8-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240327170910.23975-8-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UL7mfzQFZiMeESN1_X68lWmAWCGiObrn
X-Proofpoint-GUID: UL7mfzQFZiMeESN1_X68lWmAWCGiObrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403290192
X-EXCLAIMER-MD-CONFIG: 2c86f778-e09b-4440-8b15-867914633a10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_174312_642646_6CD42536 
X-CRM114-Status: GOOD (  22.88  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 3/27/2024 10:09 AM, Pradeep Kumar Chitrapu wrote:
> Add support to set fixed HE rate/GI/LTF values using nl80211.
> Reuse parts of the existing code path already used for HT/VHT
> to implement the new helpers symmetrically, similar to how
> HT/VHT is handled.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 588 ++++++++++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/wmi.h |  18 +
>  2 files changed, 562 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 46ef2d63a3de..72232285d2b1 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
[...]
> @@ -3888,8 +4130,9 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>  	mutex_lock(&ar->conf_mutex);
>  
>  	nss = max_t(u32, 1, nss);
> -	nss = min(nss, max(ath12k_mac_max_ht_nss(ht_mcs_mask),
> -			   ath12k_mac_max_vht_nss(vht_mcs_mask)));
> +	nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
> +			    ath12k_mac_max_vht_nss(vht_mcs_mask),
> +			    ath12k_mac_max_he_nss(he_mcs_mask)));

When I run this entire series through ath12k-check I'm getting the following
issue here:

drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion
drivers/net/wireless/ath/ath12k/mac.c:4170:15: error: too long token expansion

caeed0eb7fb4d (Pradeep Kumar Chitrapu 2024-03-27 10:09:07 -0700 4170)   nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),

I don't see anything wrong with the code.

Even stranger is that when this series is in place, I see this same issue at
another place:
drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion
drivers/net/wireless/ath/ath12k/mac.c:7903:23: error: too long token expansion

But that is actually pre-existing code from the original ath12k driver drop:
d889913205cf7 (Kalle Valo             2022-11-28 17:09:53 +0200 7903)          nss = min_t(u32, ar->num_tx_chains,

And the issue is not flagged when this series is not present.

However that same logic also caused the same issue in ath11k, and Kalle fixed
it there with:
https://lore.kernel.org/all/20231214161740.1582340-1-kvalo@kernel.org/

And one of the MediaTek drivers encountered a similar issue here:
https://lore.kernel.org/all/5457b92e41909dd75ab3db7a0e9ec372b917a386.1710858172.git.lorenzo@kernel.org/

So there is definitely a tooling issue here.

As a local test I added an intermediate step and now I don't see the issue
here:
-       u32 changed, bw, nss, smps, bw_prev;
+       u32 changed, bw, nss, mac_nss, smps, bw_prev;
...
-       nss = min(nss, max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
-                           ath12k_mac_max_vht_nss(vht_mcs_mask),
-                           ath12k_mac_max_he_nss(he_mcs_mask)));
+       mac_nss = max3(ath12k_mac_max_ht_nss(ht_mcs_mask),
+                      ath12k_mac_max_vht_nss(vht_mcs_mask),
+                      ath12k_mac_max_he_nss(he_mcs_mask));
+       nss = min(nss, mac_nss);

So let's add something like that in v3 (perhaps pick a better name)

(Even with this I still see the other issue from the original driver drop so
we may need to separately propagate the ath11k driver change to ath12k).

/jeff




