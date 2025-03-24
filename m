Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AEAC36002
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR5ea+C2yLZfOeE/kBJES7M3KF97P1A35OVYH5oVxns=; b=2PKlIV50wbDpYC/bnSVFIpgFOI
	KWkuOhIYcnfoMyNZgDqW+005pqSaTUSAOYQnEpNg38fntUHlTMoo4J/dE7wwYccJGieE2YFZmegXZ
	7PGKpcODDLHRaZyJWeVjl4gDzMEd+5cOjjq/vfCGqX6m1x47YM+dUlzqXd9Ei4K+UYVR0GkEFIKBr
	/97Ujex7zBAdY+NMjYTmA1Xjs7WeYMYyLwjz0c+IFiPL4Ptb2gN7QSlw9clicJtQ/cBZtAJP60yaS
	xt4z6j2lkOkcZ+CuzmUjjJIJWajRsy078FtHaiSEQAvPQddurVW0NCvLr0p+Ym9qbL7UxrkDIP45k
	ZfDpvKeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twcPF-00000002TDm-1v6O
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 07:39:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twcCM-00000002Rk7-1dms
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 07:26:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6c1Ql000494
	for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 07:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lR5ea+C2yLZfOeE/kBJES7M3KF97P1A35OVYH5oVxns=; b=cnWdNtdSQYIbD214
	bzLpuHNqZ5XmHjAW/gLIo0zgtHnw6ZwyUW1C/kodpvFJyZmF04Me5OQ3YPxqbrQa
	t0lpRIKCFoxa02SNu9g/iEnWgrBL4twq4nRfAxsD6Tmt+PjRxBvuelGEIAu7eez/
	GPxDw1b/9ZbpQraIJsZYTjR6/56zeI5HRrrmTz7LRoUZeau8mwGNdcR/KBorxK0Y
	2Gzu2UmH5kWVckb4yHaRPnGk9ShnF/g1//iZDWChogcRRmFRLB1XgWbTnyBYx++N
	j7yV8fseHxPWbAIYoMGa65hgo7U2yQ/iN97T6lN6kZmRBpgq9ab6aCBW+H+O4RGo
	VMVgNQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wbdws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 07:26:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff8c5d185aso12581413a91.1
        for <ath12k@lists.infradead.org>; Mon, 24 Mar 2025 00:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742801172; x=1743405972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lR5ea+C2yLZfOeE/kBJES7M3KF97P1A35OVYH5oVxns=;
        b=QxDFwdMnVQjciCtCtZMG2DisuV3YOSSs24wU1o5ei3+MI3E0q5gCxniEGTP//Wg8EO
         FQ+cGWyBZm08NwTH8PQhwmCpQVpMN+o/7mtQAZVPbe2RZmEF+UggweR9KaDrVr2ZDqmG
         WFxlq6YYKOt5IhLGlJRpUShv9OWT82uCMK4jjmBnnpyvczBb3F3Yy5bI1+CjJ0s7bV5y
         TvmqLwq84xCGQOgQnhSAEhTKQYLm2AM0UAcGei3Qu+9+S0pUeCJ03BayNkEloc9j9nGZ
         G32Bhq5+Zx1B4p2Fa/qlTzt7T6MuA/mN9RoLyFzWXAEjy3gl9PTr4IbGjkTEayv691JS
         gyYA==
X-Forwarded-Encrypted: i=1; AJvYcCXSjdN8yun6hsG2tcf4ADONmFdB/M2SVM/GnHPFOy0K8jxvMYJYqoQS17cS+HbtunKZbXf3nWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxkRnApEsbAtrxvdrEYMVpgLwmh8k+smjhthiwW2exfsagoytRW
	UULUyHYCqSmGIpWNWYuwrZiOQO9Gg3R12s8WZEPfnxCPYPXGvMvCD+wMGABhv/QIR7Rwf8QMJN9
	NkrlaBvA4YL+9URfn/LX255cyor4P7UnRtmF5WSAdQ5WZ+lIPcM0hWpYdy5F/
X-Gm-Gg: ASbGnctj1Q2dRg1A9qZWT9Bb67VwJZEMwKf6beV6gHAP9MIRni9S7Fjz+D8gxMRjFNL
	vokTDEgmS3/KEYJUzXeb6xdji+BJ9SIuqZe/3Gposuy7U1U2+jNnUbPOHnjR6t7BPHN9SFy1A9H
	QMei2tPvdYmtgLg7l34OTiFJH+y+xLvwveC+g1FSd6FNCris/1LyXfqAJvhMNA6KzG9+7XBnRWI
	pc90LrVtCUDr4pBUEzLtNsvB/KNtJkVA2BVsEdEpj6dST67D01Uf/vf1QgMp2ETtYHZfdXi/C56
	zP2wTp09WlZjLiovoNS3VrOphV1XLBbDVK08otR2LcvcLqTK5ES2ha2eCs3ri4Y=
X-Received: by 2002:a17:90b:350f:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-303100222fdmr17145930a91.35.1742801171736;
        Mon, 24 Mar 2025 00:26:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOux8H1C/P8FvbfQViLsF5tSDzG91ByVRPbahiDPOqTskebo61TG8MwkLo3FPddFwJrxCxDQ==
X-Received: by 2002:a17:90b:350f:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-303100222fdmr17145900a91.35.1742801171205;
        Mon, 24 Mar 2025 00:26:11 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.235.36])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf589fbcsm11397233a91.12.2025.03.24.00.26.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 00:26:10 -0700 (PDT)
Message-ID: <5e293e8e-33d8-9a5a-0b32-929d2790b01a@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 12:56:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v11 10/10] wifi: ath12k: add monitor interface support on
 QCN9274
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
 <20250324062518.2752822-11-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250324062518.2752822-11-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a_Zccx_QMzyB_AxWSZT1qsavY7jBfEoY
X-Proofpoint-ORIG-GUID: a_Zccx_QMzyB_AxWSZT1qsavY7jBfEoY
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e10915 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=P3F+j+0UjHwaDtf4GQVMUw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=xH0xcr9_mYJ7sMi6Wl4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=947
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_002614_561792_B2B7C1DD 
X-CRM114-Status: UNSURE (   9.92  )
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



On 3/24/2025 11:55 AM, Karthikeyan Periyasamy wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Currently, the monitor interface is not supported. To support the monitor
> interface, configure the monitor vdev state identifier, configure the HTT
> filter setup, subscribe the mac80211 NO_VIRTUAL_MONITOR feature, remove
> the VIRTUAL_MONITOR handler procedures since align to NO_VIRTUAL_MONITOR
> feature and prevent monitor interface to transmit packet. Therefore, add
> these procedures to add monitor interface support and enable the monitor
> interface support on the QCN9274 platform through the hardware parameter.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

