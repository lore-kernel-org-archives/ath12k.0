Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6DEC369B1
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 04:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlVeRCT/HA9mQOyGA1sJmvRkxB5EudIduIEIN3zmjlw=; b=OQGOciUBeY5kqWaK9ocTrieRTd
	9wpxUiDf25QQ7Khofj81Wwd4Ohh34ge8KncAEMM8V2ehW2Z3JhP4/S3mXmozc3RM1om6hjK9Nhm09
	WqRuJ88i/dNqRjNhtlv+X34fPCIQOnqrrV4pSmtikUeMnRzK9Xt1MnQ+aEyC0plnkQBk62nkSZxQU
	nIV5qtUXg4JdrxbxjWZcUB1TuUscNr3xlEusvnr/D6DK37RG9oQYhhFUmk4n4OnJ0SE20QM3cb/Bl
	aO+sMYHC+RtdsuLytQGtKm86lKqruDjd5l3ELd036oTbzah/n2WhAXTO4pScL75dqYcW2+icrj+Fn
	APnTA+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4uBU-000000087vX-26rz;
	Wed, 16 Apr 2025 04:15:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4uBR-000000087u8-2YfE
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 04:15:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FJ9dB6005850
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NlVeRCT/HA9mQOyGA1sJmvRkxB5EudIduIEIN3zmjlw=; b=KtFBvZ1y1C24+NZf
	OGKkTg8VhzNHDmujeBxEO5sMKPlv5/8JA8ufH95inITQ8+LBUUqiNVdqvv42h7db
	0Q13LUjWIac8uCszS2h7zrF/lt8S7FNSwsXG8EaDEOOCMmd5Rsf25AKmkL8wf9vv
	Wnpef9xt20yniwz87JBbUEJhZO7E+6JpB9uLWWLMHQBrxqw0K+7VXHkOkQCKikHR
	A2nY3lRbrfuWA55OPCgNiiJuDztUNexDfxuG9v5t3X2Auj9bUP9dYMflZue2J10w
	ylVb2iVqRiJZJS/qeAAQeoC9K6WIRBOy+xE2M2QdfFgvbhQOIwMyyUA3wEhBHU/K
	OWSB0w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjaea8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:15:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so43687815ad.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 21:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744776932; x=1745381732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NlVeRCT/HA9mQOyGA1sJmvRkxB5EudIduIEIN3zmjlw=;
        b=GqKh6+YEKkEmdE1PY1XkeaPzgAK1RWzGyVGAfp0hndmBmTmMRDHimU/MxakRMdGNtn
         AY29XE1g/Gz8hn7brlpQ6ANMPILknlPdtNMyM33xUKzVKW/UCtMoRCIMdVOrcuxJB7Ar
         /mx3xXO0Mp+9g3ktJHxqgNNaoDzbdFdFemgm627n5cBJcDCn3X2hwnewhKrXs3+h7Vio
         5W3LbKGxI5etVBo4gCqFfT+nkCJQ/fL6GJ8NO4eEz/rOa7wVE+5ASHSvWYJLF45GW3Nk
         Pt56KlbrrXaWVMKibzAyNKUQtQiGtQINzMmRBv5R/g2jd+Sy50fsWwDc/DjaFTLBkxhc
         j70w==
X-Forwarded-Encrypted: i=1; AJvYcCVoy1DusR+6Q02ni3UU8e7T3Dr2SQ8quSo6IJBLbKIEgtizTz3PMsUgJPZAmuHmKhBVaFCQuLQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPW5TXBze2UaBrpqE1QUBoc5AO7TaHvswCLsaMn1UxHlsu/K4
	WGUB3IwiFzUBIi7h6REi76aZh0HI1M+emujVtKK8xjN4CbP1jtsTWEz4n+mGCbTE4kIL63a/Dr4
	ovfRo0sASgCcHG47lYquk9ZX6U2eScXAuDaIZxwJw1VoSIZEwsvK9gIe9PVU+
X-Gm-Gg: ASbGncuikNOcVShXrw4HT7ksCHAgZ/rsdzwlAFK4+uWf9psLhWchsTbTzH0CqX+XPTv
	R+v8PZ3BNhPhG/MDn2GkZXAGDsLA3eEnr11EjWADxe3jSV/NHZ/c6JciS9FWZzFLkfJP7WQ7jE5
	4b/gGXLQ9fewqopJaGGdngZlvxjVyLMGOJ0LbLBU3N7sGjJpF64QCVsSWH4EQoIJ2LXGwyuQyad
	8FAbVYHmoiCPuM0o0b96wxxr7UHgW314yo/nvRjsFIvDuT9P1GHFylqenlYFzTvE1ij2J2LRgqw
	SflSHBvTmq38lXHvBWd1wFY0QsEBxqoAyle61pQMJ09elvi07UyMbA==
X-Received: by 2002:a17:902:d508:b0:225:ac99:ae0d with SMTP id d9443c01a7336-22c358c6242mr6402995ad.10.1744776931851;
        Tue, 15 Apr 2025 21:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNbUcsphdCZulTD41frbm9bdQ26Xj3upjZXGFRDutPmwJby68S/93G28AuRuuGBzA6SCDIxw==
X-Received: by 2002:a17:902:d508:b0:225:ac99:ae0d with SMTP id d9443c01a7336-22c358c6242mr6402795ad.10.1744776931448;
        Tue, 15 Apr 2025 21:15:31 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f120csm9366343b3a.85.2025.04.15.21.15.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 21:15:31 -0700 (PDT)
Message-ID: <ffffb810-93fb-91b5-0e4a-b48512acd20a@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:45:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 3/3] wifi: ath12k: Update frequency range if reg
 rules changes
Content-Language: en-US
To: Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-4-quic_rajson@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408042128.720263-4-quic_rajson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67ff2ee4 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=fFU-EB1XsUR2F5_1Te8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dkkQHmQ3A8iES3qoJhxgU2YDY-htHTM-
X-Proofpoint-ORIG-GUID: dkkQHmQ3A8iES3qoJhxgU2YDY-htHTM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=980
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_211533_655931_C47765FB 
X-CRM114-Status: UNSURE (   9.78  )
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



On 4/8/2025 9:51 AM, Rajat Soni wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> During the hardware register, driver updates the frequency range
> during boot-up. However, if new regulatory rules are applied after
> boot-up, the frequency range remains based on the older rules.
> Since different countries have varying regulatory rules, the
> frequency range can differ. Retaining the frequency range based on
> outdated rules can be misleading.
> 
> Update the frequency range according to the new regulatory rules in
> the function ath12k_regd_update().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

