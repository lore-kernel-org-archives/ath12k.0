Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E8FCAC592
	for <ath12k@archiver.kernel.org>; Fri, 19 Sep 2025 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7jfB/eM3aZtCpbT62ScXfA6sMSuPXQ48dOM19I3DCo=; b=DLGWqrEKnY99kg9/KzwPw0Yj5N
	dHXTY1RoG9WEqa8UacRSzblqfuZ9r+s1g+2bq4QQ5sFO5oylkEhlJGhDwiQI4tEbGxyU0VBaFHjUe
	UHH7BAxrWJLdvyK8ifEkgaS+JNBrAv+VYHLxWN3g42b/tJs62s30bE6WgxidQHmGwDGJalF61zbWC
	lGZO8GR1B5m1hMNL81VutsU1xqk8vrWu+iL8VTRLK9qs4XGWj9SP1fZWrmsgfANc/OoUDItzgtOoM
	TlhS6xaFOtnkgkvgBIe+3kJBhUNJ0O2rgpDYjH5Jt4U+bN/dkHb6LGAiTCHlEUz9jUP5Bf7AiKMA+
	totINn+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXrF-00000002SZL-3zo0;
	Fri, 19 Sep 2025 09:56:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXrE-00000002SYP-0hFe
	for ath12k@lists.infradead.org;
	Fri, 19 Sep 2025 09:56:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J5cieN030602
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 09:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S7jfB/eM3aZtCpbT62ScXfA6sMSuPXQ48dOM19I3DCo=; b=X5l32HgLGSlEMNIt
	LC6x9xThmWIajG0QGPUHE6VK+GCkU6z2/RNfB1TYfUYWq5X6m4123POW5q5FcYZn
	YFU/3Iohq1Si88XsN0e9VMH+n25L9I/rOxGFiJw71WKLtWBTLUBgJum7jTOlYoS4
	ODlkl6imA9+b7+zApNu5Zxa0TbjVp5IvAoyMxqeo1K5W2QHF6aO9Atw6gyQPMMPn
	si1CXlXeoQXckA8064QgWmzhARt3nZD+DesFvRT9slWd4k0CCg3s2v7EUUNAc8xP
	B91R2eWLybLnR2OuA0x64ON7VDvC/tw0Or35WG0TlWbL2B6oiczNuyUmUzgzptzx
	PhOrtA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49916x0s7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 09:56:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b5512bffc0dso929078a12.0
        for <ath12k@lists.infradead.org>; Fri, 19 Sep 2025 02:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758275806; x=1758880606;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S7jfB/eM3aZtCpbT62ScXfA6sMSuPXQ48dOM19I3DCo=;
        b=SskivLGuuFcYiztWNgzK6MTOYftvqXQhM5nflri9vbivDrHaqEHLM/1lVofLQTeKDt
         hDzSLCrg4W4PRVmfBD6HXDe7f3aw2ICbCGffJ2XX7FWsLk/vqYyK4I14Fua50yBiZ8Xe
         h5cTDscQb8PQPD5bCqXKAECOM+aprd/ayEepEBCgStVaCGucnl99agcDMPbxo3z6Rn7k
         Wf6eQP+TDlPvC8bCKq5b7PJBVk6DuQTjyaE+2GPb7kA2TDY2Lm6VKEgkoaZoOJHf9RFE
         E9EcZezTZzAmvO7qTBi8aX7E7sj/+0XM4nzMenQGH4RwuqkKo2bCf6FkEmOA1QNZtCZr
         pUfg==
X-Forwarded-Encrypted: i=1; AJvYcCW43Br2mMFRh8HM9d+Rw5nn/oj2Tc/gxbmGftAIxJgSAeQUel9p4qJPaDPzwNQVPKzsZsUug7U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOFLFZP2l0KOm5vK9xqJr6uqAWrSJO/LzUKihMkemkyvb6t8m4
	sYHbzQ+hYznzblUN4QlU43SpEyBFrL6aicaS/qOTlu97ol53N5/3ZF2NdfMXWyR2YVefPS+Jf5o
	qFRAnaqWFoFWX9B90Y3pcyX4BGG6lw51vLBEyL98sO2S9q7LJNQz7mfqHOpf+cD7yAAYLfr73
X-Gm-Gg: ASbGncuRUPm5psh/+3LNYJ0wGHrl93NkOZb8O+grMAUqA1Rge0kTwoBQ8nrQhXjys3c
	xGI6mQ+7Av/hkt55Cxs4cN8i1yVGFMs5q7WfxpoJrY8YM6OCUmn3+gekPV9gDxlZbCloG1/VBpT
	FwRN2BNYh58F7GywS04ErKk+VOTC8EmBffAWw0+ar8nI4gbPs2DV6vplVMHBU7Ukk0C1rgMevI0
	FM1Oglt6kaTd0Bg2oyEfQ++d0HCAqOMibLIor9WxLSU/dxRX5AYl9f5AdRc8mkq2vQKzMyIKveV
	eM/3Bk8UgaAjuWIj5vtDrTg/xXpy6OpvaSWai0QuXwPUliqv6H0dNsN+AHqt8uZTdpZBoZQ+TEg
	ORAFS4wrGMPlrXJv2EAiuEj52Cs/GjTGTehO2
X-Received: by 2002:a05:6a20:3d85:b0:249:9c7a:7715 with SMTP id adf61e73a8af0-2925c275680mr4158386637.1.1758275805746;
        Fri, 19 Sep 2025 02:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaaiAHpsZgqhNCWxPlJIASuEA0qV/NZaJTBDHc6ByLkt4zBGQcL4Y8Ftso5oUD2dqTCgeoyg==
X-Received: by 2002:a05:6a20:3d85:b0:249:9c7a:7715 with SMTP id adf61e73a8af0-2925c275680mr4158341637.1.1758275805116;
        Fri, 19 Sep 2025 02:56:45 -0700 (PDT)
Received: from [10.133.33.30] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551905bbbdsm1597080a12.31.2025.09.19.02.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 02:56:44 -0700 (PDT)
Message-ID: <5dcbc728-b440-4f84-bc36-cc75da6ff16e@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 17:56:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix peer lookup in
 ath12k_dp_mon_rx_deliver_msdu()
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
References: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDA0OCBTYWx0ZWRfX2M+1YtcRrhRh
 xsJdOkrTmaKU4jsT/c2DBOvYf4ow684rwXUk2CrgiJJSYG+i9Sa24JtA2HuEwJhXLWRV0U8mBpH
 Bx3+kuiRkmolMdu01yUUlx/UJqLwspiIyPmq53BiqROpXdIJH5QjZPRQ+6uDV1ye2RxeD03dnHu
 o+myl0rKVa3qCjSqRbPTT39VTBl3BoJBgSK6Xs9Q1ndYFr7j0ClelsZoSJnPAHRhwxhXpirdFd7
 FFI/bMLNw6ajJ/j2Af3fHKZiYDELpVz0LbZW7zV6n0ONd9zQHCsJ5wu69heboHuAqHHhlG0gR3m
 RqW7ubn0S00D2DDfFkGP3DwUr7XXb8aGeeh4+CjpmVP5q5VXaoK+1ANYFnl/aGFvHsfyBO9OPv8
 O21PoHs8
X-Proofpoint-GUID: Hl1xL8BxMYfe9spHVPXDDgretwGCqQ2t
X-Authority-Analysis: v=2.4 cv=LcM86ifi c=1 sm=1 tr=0 ts=68cd28de cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BhMcNSPQYusP4RIe-kMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Hl1xL8BxMYfe9spHVPXDDgretwGCqQ2t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509190048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_025648_220116_A0D6F58B 
X-CRM114-Status: GOOD (  14.22  )
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



On 7/24/2025 12:05 PM, Aishwarya R wrote:
> From: Hari Chandrakanthan <quic_haric@quicinc.com>
> 
> In ath12k_dp_mon_rx_deliver_msdu(), peer lookup fails because
> rxcb->peer_id is not updated with a valid value. This is expected
> in monitor mode, where RX frames bypass the regular RX
> descriptor path that typically sets rxcb->peer_id.
> As a result, the peer is NULL, and link_id and link_valid fields
> in the RX status are not populated. This leads to a WARN_ON in
> mac80211 when it receives data frame from an associated station
> with invalid link_id.
> 
> Fix this potential issue by using ppduinfo->peer_id, which holds
> the correct peer id for the received frame. This ensures that the
> peer is correctly found and the associated link metadata is updated
> accordingly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: bd00cc7e8a4c ("wifi: ath12k: replace the usage of rx desc with rx_info")
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


