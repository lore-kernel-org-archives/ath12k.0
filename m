Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FF1C43602
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 06:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arlpIOlawXzNPeVHxL/YlpYmCKpbjQtKKgS9w8+/iH4=; b=1K8odo0crksMWDjOcEFNQsCy0d
	d/tjXguGAuXOJ9IQtuEvOs9YdFnlFsHp22MEvvo5aFIfgHyzZpQSEl2bF4FjejChTGj54YeyyWbWH
	XF/gc92iMcbrYEyBloQFpTQaRY9adhknsCdQEhYSDzwoNRGYpsBlzNdI0JSvD3uPXOhx1xRf8Xuwu
	XJFNw+MmcY+3EfTHKzAwr7AUq/Wc4q/8be4CyG4GdyHf2ugT1aDfYCnTDC1UG0fSUi9fj+9Tjixw+
	HqdIJLTA7mtKgR8toD46MNnqmHGLafmKD43iVO4RP4nFqsKZyeKK7ksu1HH6P74+aunumOT5KUg9H
	q64DHmLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5dZ-0000000Dllt-2gZy;
	Mon, 29 Jun 2026 06:38:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5dX-0000000Dlla-35SR
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 06:38:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NaAP1767236
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	arlpIOlawXzNPeVHxL/YlpYmCKpbjQtKKgS9w8+/iH4=; b=WBE7FiYdOcRV5RoI
	ZgCHZiGTTkIeVVcljhxf+ooY3c7zEAA5Y3tuf/jL0bV128X5uUOlwPTB2xvyjk4t
	OR3sGq5S5tDTzd+MxZ8mUbe2041LcUs9P+lHZuNam3Qg0IkD0XuSLZkLGQr+tVCT
	8czz/nqcbpM6y8xvYIlzwYFb0BiVYNNyJIgbXzamxHI8QpuvpvQNWUSwkyQmT9Ek
	zImrYUQClYQGQs9emODSGawT5UKLCREyt3uZLMlfr/wzcJu1156Cqa8/OAc0CPY3
	FJyV8Pnf3lSi21wOtfWDPLTo1I5Rp0oZCyXHu75s02OOXOZFENqx0RZvnKs9bgnK
	cAbXrw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a51h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 06:38:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c856470fe9fso1521136a12.2
        for <ath12k@lists.infradead.org>; Sun, 28 Jun 2026 23:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782715042; x=1783319842; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arlpIOlawXzNPeVHxL/YlpYmCKpbjQtKKgS9w8+/iH4=;
        b=U6g4KqASjBUUhTm/O+3IUalCi663WGsQSqX9Mib8bsNMWhVvqkazK46jatHQtYzL3q
         uhxMnEAvMxue+vSLku/qh/zU/ys7YUi3tO0TDpacjZ8BMe9nQLuY7iRalcCoPFtWS1BG
         hbYsUgtfWk7b6N+HNatHXwSfz6gvS4z/c/wLzSf+PTeX9BiObFhEgPl0TaAZgMTCpQuS
         uTPQcxDMRG835coO5EaMwgjCO3mYPM/YgGtoNltLVI3tTlFnR7I62eu0FIp8rZnzcY6A
         M2I3Ox5InwkGz0FA5MTHGk/XoV6a0RDZE93Sio2yALjjuPNa2ulQUnikaXEEE62EwiYW
         PNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782715042; x=1783319842;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arlpIOlawXzNPeVHxL/YlpYmCKpbjQtKKgS9w8+/iH4=;
        b=TgNs36tK5PyfqZIIbFBsPISIxAPoTEqm8VxUSyYtDpvxI4n+IwZN7mXwW21cpHmStH
         N55H/XqfNZSufr5U47mt3eW/ETnx7CDupNLCdi1vyEVB2JHPb6X1YJGUYNbcBCiqYeTW
         TEQVegjhSfT4TGH/ECsDWh/MIfsekqrmmvII9oBuxiwWZvnx51Ifn3dVndqflL2exD9H
         L1t3oO+g3jT4/0uwpQnU+BY0AsrjF4bn9vGtEgxXTVDOudZK1NOGHjxtzVdnZ/KbBji1
         85DEKecyT5ZceMJkCOxYmJfe/TwcDCvifIXpWrzxZD2RkfnqVS0gyTWh4Qt7kW+zY2eR
         hS6w==
X-Gm-Message-State: AOJu0YxPQzkqOAG7H5f21vuXclRFr+F/SIZXpUVAOH4TStFXj89WIdRY
	y1VED1rMuF2zuzUut9ZBBNQ4YvpA5+oMVURkZH50hAGg8NrKJKq0vDk9Vcd5AZulcukJuaqfdlr
	C8DQteXi357ox+MBS7LWQVV5LxrzeHmaNrFoJmzcurb+dLV08DjruN9gRZWCjtWu9
X-Gm-Gg: AfdE7ckf4pilyz0tWxTQOznQJfCCEssV0OaSc1q3IiMnG4CiGwEGRAhEaYyMfjLm0mz
	AIfK8gLykKGXZEwUWT88AcJxuLRFODxBVzqwgo8Bi6Gmc347sAU9WLItYwvT3p2mTSgjGnpYU0Y
	FO3UvJd6j19TLG4RPO1wiYGE6SZbFcem9ltP5NvrRSsdo09P1HB6BqCRl5na0N/JR841VG+Rv2S
	W5D+HsQ2KXSqESptWqrhbGfOS3iZOoDNuiNPirFXBx6ljSU58pAJFMz+MDpN7UKsLMJCwpNLOA/
	mOjr42NpTxHl9UDaCKBhSBLXRsCBl4XxR0718T9g3twWqyPjWZBqxII54KkljSWxSQCHPhAkFBR
	UabQsJrUrnwYFNQPEn1KfwplmCNDUcBKc8DWKziNCCqxmyonqgc24Uz8yT8+UDHBbHhc/aLeE+p
	DD5PIx2A==
X-Received: by 2002:a05:6a21:4516:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3bd4ae9f317mr15418834637.35.1782715042458;
        Sun, 28 Jun 2026 23:37:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:4516:b0:39b:dea7:5626 with SMTP id adf61e73a8af0-3bd4ae9f317mr15418822637.35.1782715042007;
        Sun, 28 Jun 2026 23:37:22 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c96f1f700ebsm2193606a12.30.2026.06.28.23.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 23:37:21 -0700 (PDT)
Message-ID: <3b028746-b00b-4281-a485-49c14c4a026f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 14:37:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: fix rx_mpdu_start layout for
 QCC2072
To: Wei Zhang <wei.zhang@oss.qualcomm.com>, jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260629061529.1993932-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX+fsWTEdwvNNg
 omjk4yVpNg/q7MkADRk/9gFdoyPmVNlEG060pIpOYrXB8BrnG9Ms3q/lLIINTx1JYOn3GzDJN2q
 DvGLVWb026FPcSdTPXCwN8vqbkVm9/v1xTl02hA1Sp6GoviztQRxwoad5PX0TjILcGPWno1YiCE
 tK4p8+UxBaADY0dyFFHguh9pSKdUra9x6sBc22u3ZwioSwqpRWnLsuIaaZYpLQeqtct86/4vBck
 IMqrr7GaV6PoGztlpxihEowruap2uM90bpriOWjVkSXzmHYu9UnI/mpJNfqvvzmckaTO9UkbDl3
 zNdN9cFwyLKkI7qWvSAyJR6m9isu9gGOZbWS3suNgs9ALCFoqU0nbXM66K5HzmpceNlEtxcbhOV
 +TvulPhu1uAA1EL2TPAQrPSXSiHTUUY0tVWrQ8Cwy7KwqUQhXWTGoqvh5ENWKsmZ5MdFwTEzUBk
 rf4UxhryTmyEWihHBFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA1NSBTYWx0ZWRfX5aXOuJVNxCSe
 W2QZce7mQoBjBZl+PoaNY4BypOSceTvXgpQJg9cJRK3K5APkkoBKVcPSfiqUEHZN93cVfOQOigb
 ypbbxZTMA4mA2CuXy9gQoO+F4n8C1AQ=
X-Proofpoint-GUID: 4QRfmbBpRjeG9laasuSFyEVNgGf9zpYc
X-Proofpoint-ORIG-GUID: 4QRfmbBpRjeG9laasuSFyEVNgGf9zpYc
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4212e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=EB44UgcCvd3G_oUa3FEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_233831_806646_BE192008 
X-CRM114-Status: UNSURE (   9.53  )
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



On 6/29/2026 2:15 PM, Wei Zhang wrote:
> QCC2072's rx_mpdu_start TLV has a different field layout from QCN9274.
> Reusing struct rx_mpdu_start_qcn9274 in hal_rx_desc_qcc2072 causes the
> RX datapath to read the wrong offsets for info2, info4, pn[] and
> phy_ppdu_id, producing corrupted sequence number, PN, ppdu_id and
> mpdu-info flags (encrypted, fragment, addr2/addr4 valid).
> 
> Add a dedicated struct rx_mpdu_start_qcc2072 that matches the actual
> hardware descriptor layout, and use it in hal_rx_desc_qcc2072.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00188-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Fixes: 28badc78142e ("wifi: ath12k: add HAL descriptor and ops for QCC2072")
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

