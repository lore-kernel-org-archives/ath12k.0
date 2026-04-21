Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F39BF8FA79
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 13:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzsp6UDhZW+yTfp3yNKZwac94XGWbSTow4ypteK7LbI=; b=UtpZcZxSSp1EJCcQjIfYsQhtPM
	vbx83Wwdert+cgec5Y52fpncKL9XyStY+pjbb6Kk9SaruNWq2l8ic38GVF3UnKZ2EmUlrfIGrFjyw
	muk+pZzkFWxjT5onL1MQtll7MCycrCmxeHd/opGAigRH5COxLmzv5vRormBjXqqSvmbj64Ge0rKct
	sVgavyetNISjCy57CA/sHtv6GmYndMqWTV/kCBulAQyKGdYtuAdLah0J301xArDLOG+PktNKAvrPQ
	EPPQ4v0WvE91VghsdW29ULq8+LlZls3bJQnQtDUwVpluG3KDM5El8ZCFQtBzzvxTE585LVVjcTFaY
	GgOsBhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBBM-00000008fhe-1Yk2;
	Tue, 21 Apr 2026 13:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBBK-00000008fhM-24QG
	for ath12k@bombadil.infradead.org;
	Tue, 21 Apr 2026 13:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=xzsp6UDhZW+yTfp3yNKZwac94XGWbSTow4ypteK7LbI=; b=HuviJksymJQZx4bEdYHML4rtrt
	ffhO3gaVyekedBT2gd/dWKWUb/3vmQVgz368Oedek3RjUEL4XhtERvo3ri6iAPRaqE35Gia+5/a58
	mi0f//2oz5kUQppMQO9j90EgKsx/cIFurOtoUghXMsxnP9Z79kT0+WfESXZJfGi2Rl5zZZJcH0014
	rD76r4pmJ0oEYmJVY67rL51cAcGmS3U7Hf9sMsfpy4HSGzlWrPGrzyBbDVytQJAHt6PLV+93K4Ixj
	UYObVIireOEZQZGDwIr8I1qtuyNrjFk0gpTPYAnHGs88q7Qclwt5vps0Z+szd30ZAlKf1Xi+wGrE7
	feHPZqXQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBBH-00000009pQP-0fY3
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 13:30:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63LCtP831538502
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 13:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzsp6UDhZW+yTfp3yNKZwac94XGWbSTow4ypteK7LbI=; b=HMuEFEvmtljgmVGj
	MQdp9oNZUp0eL7j0CUvCDBoVQs9KJgdPvqC+XYRtQqZ7CbtA81YpeQrpcLbD41bD
	FyVnFY16f3+/e+qRlCq0lAH6gggNSITHckQWDIWSjsh4BG6bXs2/dQtZ1Qqip0FI
	uXGjR8UfKOZz4SERllcHm+naIdxAMW7Nw+8d/Nq4vM+HxTLxbs+1ljumGbWdFB3G
	c9FwBIrldY6UOH5C5Z1eqMH8DP0bmhOHCO+LjJyaN87qbnemfAI3IZ29r2YDH0k6
	KD8dQ/xMpj+8+29q8PpDNUgsOUUWbNFhT+w4CNzdzNmIExzGgfWnz8ajE0ZfUchi
	eY4sdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahch6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 13:30:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2da19227bc1so2773820eec.1
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776778218; x=1777383018; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xzsp6UDhZW+yTfp3yNKZwac94XGWbSTow4ypteK7LbI=;
        b=kRrmKEAESvdNYQ7MCoiJv4jiWN2fBq/8cWe47NIrXo+cTUZha/r+4sa/+9+okXqu/5
         QI48k1TRKfs0TvZlIETbcb6JPBmjRsmMmJq15UPzMCFcGjEfdE2M3Muhl/P0IJZRREV/
         t1vzN6hd4X0+ibSPvryusUaRBWOoXR4byyM+BDQMq2w4yQBnv1YZuguZScTcVM3kMYzy
         6FmKLCO6JSUUjXVP8b3fmYnId615eGXH68lUALskk+ixoIPq6R21bnelbRIR/J5eaxAr
         1TO83x7vjvNMkkxNHqMMVw68JBf/SqNvV1qyRlT7efgIUf/E54uDuNB1PzwKw7KEqoug
         EOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776778218; x=1777383018;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xzsp6UDhZW+yTfp3yNKZwac94XGWbSTow4ypteK7LbI=;
        b=sJ02aD8MI6SsSlLxcgaRVHnXJyH2jrXY3asXPCev2GBTGpYih0ZTLZmf2W0e29TUy/
         SQ9D6THn7HLEYuk2qESC5TxoEfYHDhhnYF4c4j3+bZdCBsEVUUFq+RTB6ySRlN2D/J4a
         qtUgm34AoV6Dm+X/10iiXMmJERHDgCaaEbd7BNaUBnwNHF3Z03wAEVJRFXeF2qrhUlrY
         oJJcdmb16v9606yAE5XxQ9O1E1TkPPejaYflXPjKZkHlgV7MnkjML6S8hcDPDKlayhDq
         Z2gSWRx620oDofx13xi2Z14siAxcvAZItlePb6YR8Um8rQ9Vn51FTowzKByQhsukjzsC
         D4BQ==
X-Gm-Message-State: AOJu0YzUIayiR/xSXq7AIxXZ0dkivfwGbtOV0lvt943Q/xPaElFMKRt5
	r3W4Fn42vts4G0BIpUQjIpRyB+AeEQMz3Sp3rsJDbxlD9Pm/YOv2cZofCWxJMZT/ylpcuGbeNtp
	lypBNTnbU2gVclHlGI5h0jKq69WLOU8kta3HPc3Uxk+mDMJgNPIwBdVNQZKGTloi3
X-Gm-Gg: AeBDievIIeLfUKA2Wc+Nyx8FlD1N2gstpLm5QUHFjwIeq6YeScxdqi/tiILlkw1xCCt
	mgTy2CHKtCQpNhILlwV0IJBmBUYnAIKShzcszdTLkVeejTacDoU8hxL47pcArMEnaeM3zbHg9ha
	E+ng0TexXdAIK/3N81TpsQ09Dp7nBR3h70CD24DkDWb8c7s8Yw5awUn5HBKHZmZvp3s78xxtx5a
	p9YwFNjQNUJUNsArckWQl2SuoKlOncGedrRTMnu/22s/gOWCoAxVwIEJbdHE5DLjsmapb8kJTTD
	Yx2Yxk+n9UAxquaT8sO09jZyBAvQ1pkDfgSuOsl8QQKV5a6e8gVSFsRnVbkN51BP0L5JcckgbYi
	dekY9jOnB+HzCMXBO0GXgynWKPg66uI7SO07o2JvOEeKijoRqtvw7EItHDsn/xM37O+BEsccHOw
	+AWV2OCb4j58g=
X-Received: by 2002:a05:693c:300c:b0:2dd:c066:bfe with SMTP id 5a478bee46e88-2e478a331bfmr11147925eec.21.1776778217628;
        Tue, 21 Apr 2026 06:30:17 -0700 (PDT)
X-Received: by 2002:a05:693c:300c:b0:2dd:c066:bfe with SMTP id 5a478bee46e88-2e478a331bfmr11147822eec.21.1776778215177;
        Tue, 21 Apr 2026 06:30:15 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce440sm18480206eec.14.2026.04.21.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 06:30:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid IRQ requests during
 AHB probe
Message-Id: <177677821410.4175191.9930496878940728154.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 06:30:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e77bea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=G7bOcmE9FAL1y-DpTj0A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: WZntFBxjyMkl-EmEvOFLGb_t6_vE5YVJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEzNCBTYWx0ZWRfXze2ULkFfZhNU
 J+iYGfFAkSKNR8AiCveuf9EEyhBTaQjpRnTNM2548ZDOyyg9EjPWQV3BLLCZlS9YBb3WOTQkC7u
 YDShCAgMjeQYZMzPguDD81V2TxBcTOodIQOYkcBGsIfKFukiQw2KRuV+Mkz8QHH21EmVgzZTwv/
 WX1y8LsslE0Q0f5+dXojTdldyvc1Qc7je0ChLljpd/xvSSvTvzZV8YLAzh00Y4iCLF0XdQn9QvS
 c8QmJHgEUzblHeqny+EH+9Vv1GLXaPUxDEubpica1ci1yI0NKNNkyOnsx/bR99eW3tjIQarD8Zy
 dFh9NccWzKe0Mzz3Fp3IL2U9b+1r7iu/e6Cx8Z9ulHFXl+m8/6VqeHRMCG+M2TYNqUcOgGkYCnH
 TOyN9zbRvIr+RwaFWVd+HjKTw0AmvN5t2itB55R4lB7+oeMZqyhSg1nXWTJ4nz13vobAFMKeTfq
 Tm5FQFhQ3/8C8CLJtEA==
X-Proofpoint-ORIG-GUID: WZntFBxjyMkl-EmEvOFLGb_t6_vE5YVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_143023_619760_B00EC0E1 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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


On Tue, 14 Apr 2026 11:58:29 +0530, Aaradhana Sahu wrote:
> ath12k_ahb_config_ext_irq() iterates over ATH12K_EXT_IRQ_NUM_MAX (16)
> entries while checking TX ring masks, but the tcl_to_wbm_rbm_map array
> contains only DP_TCL_NUM_RING_MAX (4) valid elements.
> 
> When the iterator (j) is greater than or equal to DP_TCL_NUM_RING_MAX,
> it accesses tcl_to_wbm_rbm_map[j] out of bounds. This results in
> reading uninitialized memory for wbm_ring_num, causing the driver to
> evaluate incorrect BIT() conditions and request IRQs for rings that do
> not have an assigned interrupt line or device tree entry.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix invalid IRQ requests during AHB probe
      commit: 590182b72213ef04977ab0b16b8dadfcfd25ff73

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


