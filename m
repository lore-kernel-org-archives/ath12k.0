Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD17DC0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 06:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dw4RdPfMV+paR8BSlVBGfl2KemWUSGdoGSUtVVl1s+I=; b=Fd4oe3k1dD2tnRfMe0Jg8ftVXU
	wZgxeSjNqaoui8WWcmnwu4eLsebeWV3fWi2J6a4t3MoJFxBXGDg7bEs9Ez+KgSCUw8yfBs0QE4VHD
	nbR7zZwQ6/H1mrqQAM4OYtb04gp/d9Awg4VAjIBPfd/PKuvEDD08/VCy3/R2RcjXtndLw6jNsCtvg
	cMyL/Nx5IB0NNTeityhycGRhVVNODZUnJvFfO//XXzLTDqEjWEgWPvOwDj/A4zEanwt/XmOQAFBjW
	luMu9Umqll8UWuEOcyQJ4wXNUZrfLwfQ4ZToYCfU2pBQGu3/WZZJSpiP0o+tth9HbFRdk44lwm6uZ
	BFGFxgjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCRX-0000000HMrk-2Eoq
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 06:29:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfCQw-0000000HMqD-3wHn
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 06:29:20 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IqIeN006867
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 06:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dw4RdPfMV+paR8BSlVBGfl2KemWUSGdoGSUtVVl1s+I=; b=dO0a/CO47SjcKH4d
	VglWTPbBR8ZYuC4qH0sp9jZmIHBlyeHzu/x/rUcM+WLpEJcY5nCDmelRvHYsRBHV
	a45LjWNBNelswR2Vd1aZPdQ7ukv0I+q1IyLj60HMiOzRNH7NWi/Cxd7b67rfAPvs
	UIf/P5DhSsbfMxcKCiVmKxg/49GRc4di3+GRY29ZUl5QofyxO11FokCCuWLpQw3T
	NfKwL/uA+GqfcR3dh1x0RBUnS2YRJaALhWD5KxxNFyI8NbYWmdJ12rGJChg5s+Lu
	PIDjY1+/4UYJCkfGwmgxPbgKDlpdWuZaIM8MVM5UZ22cTpKwgpZtZrzk31XA/ila
	0u/QlQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex186u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 06:29:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166e907b5eso96265875ad.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738650556; x=1739255356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dw4RdPfMV+paR8BSlVBGfl2KemWUSGdoGSUtVVl1s+I=;
        b=N8tO9R1+hM752DGQ+31X8aS4SnCZbTvJR47RvVsNQ5aUYA2ZChFg1iWYVQOoF3+k0l
         Xs7xmxHjI50Ft/T3YV/AgkZQOBdrc0FlI9SaabPJxYk10SJnGPJME1RFUL92ij6rzOX+
         RISQBKqGEDgqOfcKp3vr8wz+zXlMrRHKQOC1yqYFtmcrbfubDbSOvbzdTbpnnhWypZaf
         pYwh2Gjjk5klW7wSHuBGpvIMehBWHmcT9/05kheMlh1gHkiuxbCpNWBDY6e/M3aU/dbX
         LzBSZLsY9iZ4vWW3YE1f0p27RlVDKBagJsS8E+CL3cbUZbonMLh1vQ/dRFIkSOxFqjEK
         rsBw==
X-Forwarded-Encrypted: i=1; AJvYcCV4QhffQ00D4rjG9SzFyBZ5YmKhpSXIsv1yjyIa665yry90bwGZMhFmkzlhmD1MyLSrACQJCmk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2ihP8p0rxyYGEDNFQKgFv/H9N7TeDp04IuayWNB+C01bMru0
	wTgQZkLTNwUqgYvZBDAvkR1+/+FJrA5BMlhPxyhhj6LIlexezMSNn1oYLDOCNv7hApmEDOXpPo5
	pvAs2GUBzfEmgkIKFi1A8lAOnk9yeYdCANO36u2jqPEDR8NB9bztwj/cTNBC5
X-Gm-Gg: ASbGncsTZEKsxtQbqtUF3ub/U+dXVuKa943bBPhhb0A8U0ZkCkoOiuiOdyYbhcoQs37
	i/Z4kM2rKkxDKMsDy0rO9k5ghfccIKxdg+GgvXQAJz5VfZKl/+AaXr0wLC799ZfmFM+I6Fn70/b
	6uPOOkxQcE69TQ/sjtKhVDpFMwZKou4rAEOti9q02wdPcAhYR5P65DpKuZifPstEps+R+dUQRgg
	q1rDOlLbQrR32bsQsFiFxVLAxK26x2tSGEihtro6//GPJ4GDLMuRd8/qs/OoUF5AGz54UwjKt45
	/Ys15vXPaw2TxRuznb+iKA+mU4Ax7gqe6n9eS4A=
X-Received: by 2002:a17:902:ebca:b0:21d:dfae:2ffb with SMTP id d9443c01a7336-21ddfae347fmr330707215ad.17.1738650556412;
        Mon, 03 Feb 2025 22:29:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGuQgf6eP8TP3R8aroNpvarjgHhOnZzvSaWCFsUni9H6ZSr+3e+0xv2JaH/flIE/Ge1XlHYdQ==
X-Received: by 2002:a17:902:ebca:b0:21d:dfae:2ffb with SMTP id d9443c01a7336-21ddfae347fmr330707045ad.17.1738650556033;
        Mon, 03 Feb 2025 22:29:16 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee30bsm86916915ad.35.2025.02.03.22.29.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 22:29:15 -0800 (PST)
Message-ID: <9df7c75b-31d8-4018-8418-9ca369fd9a82@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 11:59:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Pass correct values of center freq1 and
 center freq2 for 160 MHz
To: Suraj P Kizhakkethil <quic_surapk@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250204053451.2703834-1-quic_surapk@quicinc.com>
 <20250204053451.2703834-2-quic_surapk@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250204053451.2703834-2-quic_surapk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UrIc8jsUa3uEKSyaXFCWVnHg8IpekeMK
X-Proofpoint-GUID: UrIc8jsUa3uEKSyaXFCWVnHg8IpekeMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_222919_109428_52F3333A 
X-CRM114-Status: GOOD (  10.17  )
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

On 2/4/25 11:04, Suraj P Kizhakkethil wrote:
> Currently, for 160 MHz bandwidth, center frequency1 and
> center frequency2 are not passed correctly to the firmware.
> Set center frequency1 as the center frequency
> of the primary 80 MHz channel segment and center frequency2 as
> the center frequency of the 160 MHz channel and pass the values
> to the firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Suraj P Kizhakkethil<quic_surapk@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

