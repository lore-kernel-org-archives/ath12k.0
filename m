Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96B7C7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 17:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBbnGS+oYggGP8xcINqPzDyg9bhVTBGX167Aobu7/VA=; b=Lqw1iOA317RPI8+NnovZrQsBeH
	tZsRUQSMSRH0txm0TpYQd9Nw9H5F4BIXVAcpWCXjO+EKY59bnfExXOl+8phAiEWWivMeN5l9rjcwA
	BdHsxqQyUsduZXTbcaaJcmYkAtH72t3jvqmdpiKiYUy0TkK2eJuQ0e/Gtu5ugsIpVw+nw4BRJ2sxG
	3M6RebdbMviQ7N/Ii9O1bBUIey3sPyUgh0FYDqN+fl6B62Fdq720lM7DLf7hMzFaSrwa2t0lkQ39f
	1iOyDGDaSCzz/VHwsc8kGZlNNNzbn9flZ1LDRyS6to7Ye9qudYgd5op+bPNODpnnLihhpgdQmz89B
	Yb8W0eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUq6c-0000000CLEV-1O3v;
	Thu, 26 Jun 2025 17:09:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUq6Z-0000000CLE7-3RJU
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 17:09:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Utxn001592
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dBbnGS+oYggGP8xcINqPzDyg9bhVTBGX167Aobu7/VA=; b=l1ykj9SJRAFSWTpM
	fsbWB7997HjDjDIZbrxeDq78WL29oFqpgpnvs1Z9KAwHztWb0DkwT1EcfHzVjqjd
	QLrYH9zbsFXJkKRaXN2o2rglEWfoYeAoT3WzVs3qX87fnCXYSSCTKDS26kIbZB5A
	xddLlUk8qi/W5esfLE8MkpbPkdnI+vH+RYKsvUMx+thWXEMdn70NqgMvtsoidgm3
	7s0KBmS6IuPxsb7A3ZRxwh08KPAfWiOl2pAfNQkARjCltcIF1aK45NzgFwp4TklP
	p/KKhgDBoNPe8JKbxT0N/F+VSGowgLsYBIJQdqfqEkmwMk2IgHXLNPmdppSWAhsS
	RLcWTg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq4akg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 17:09:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso772157a12.0
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 10:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750957781; x=1751562581;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBbnGS+oYggGP8xcINqPzDyg9bhVTBGX167Aobu7/VA=;
        b=ezQF0poBIv6eklYwFrngKVqA2CgRrncYP2KBYl4FCLwC6CFJh3o55fmcV/lDylF4pO
         BbiV2oWgHiS5ubXP0ARtQiBn9bWmesd8y08w+LM48e2z919691IFuvADpDPmFtC8clUL
         NRjmFmj56bboSdK9MWNr64sO1erqajoJFSBdSXBEJMumtXmDsiG11/YPt0TVIE+g4Lnz
         TWR7oHtOzCkqN77INWB6HsbYChpmKoyQx8D9aMyQ+eEfjWM8/L6Q8iRcx11qxvhE5nyU
         fbmX7UPYvoYE0aJYff0V2e+8dUVs+71K+XhzpE2Jw1c8Z5q8ofymWUKrVEQ1YTDYMkOQ
         dw8w==
X-Forwarded-Encrypted: i=1; AJvYcCVOCeAipzRakROIH4UcEpitQrzYQD5HwiHaXibKQWmm5u7KSutf+c9oXNestmf1+gTK+DP0qj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwSwm0xW4j0blLL8OGeJhQ76NDsVz6OIf51JP6tp8JOPSsEPX3l
	NntLAn1hbphpOlbmGG3wH7hd5aHkOtNsYU/26UKU5u0zhRM+4jp33Eq0LUHYvl7hMaOKvvN+Z2t
	463CUp1APnFvfVWVcOnMiPIkr6SsIbb102+vgMDT7C3Y23ZbBLDfAk+HYHvVb6pf5
X-Gm-Gg: ASbGncsHHEmGwYbRVa9+HIMtt9l2BAzt4C20UyMxqIQ7JIGxsUyb8WUqJcSmYKX8Alj
	f71DFpbUQHLkX/hdtg6mxKCyAsc2QtoduCpqGf8SXhkrU3hO1ERx0/P6ZcZkKLRffGztMw8OvEP
	FPqnq3b7FlYblhx3M54GFqSjSkYm5mX24v6HrpZ3AtwSW28zz+W5gGWe2sMCWrPtaWQAn4adqba
	BgJRSeEe0rzU6GMqF8Ad0XQHIegRy+q7TtYnBYt6tPOIs/RrHXQnCB2A8oeK3q8nyoTMsL4ziGG
	DK9UmXpwpIMjo1dT2AA5PkZGo0ySHG+MbJwmGOjY4Gb23xNPnUXV4NhOhu8iaPSw86R02P4=
X-Received: by 2002:a17:90b:57e4:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-318c1397935mr660833a91.10.1750957781066;
        Thu, 26 Jun 2025 10:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCW1a5ZF1co8iF5irAQQqZFuyGyaSJButvzUjfwQceOTHTXSOKMBGL+pdp6nWeXhiWrb/+WA==
X-Received: by 2002:a17:90b:57e4:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-318c1397935mr660793a91.10.1750957780630;
        Thu, 26 Jun 2025 10:09:40 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.255.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f54420f4sm4731292a91.49.2025.06.26.10.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 10:09:40 -0700 (PDT)
Message-ID: <a535ed15-9c88-7830-f5d4-adece072fbd2@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 22:39:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Send WMI_VDEV_SET_TPC_POWER_CMD
 for AP vdev
Content-Language: en-US
To: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250606112316.39316-1-quic_hbasuthk@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250606112316.39316-1-quic_hbasuthk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685d7ed6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/xG1ZwzdjF5UbGEDupzz2A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=fQuKbg9plGXEwmXOFSUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE0NiBTYWx0ZWRfX8AczoJVLrmJb
 xUg5EKmE+CgPX2pU+cFz+v1NSNPB8PCuVvVtptVmV/3K1yOG5LvPOtB7xi0wL+xtOgNnsCUZB7j
 iTbe790w/zp6bQosLadGljwwZ6IoYg801jvVF6pYrxaPdWIpNpYwQUu01g4AZKW2ysGUDY27iX9
 Ve+x9e/ss/0QMCyuCxXrBDhxzjP4/HH6aX39Q9DVcXXf/O8i2Kg5eeCH3TjreEBWUT7mRqQzcO8
 ZKv5niuTGoga6vJJSwZe62d0I1wkHrRBIG/hubh29/3/FiexXp0E5bLuwNB5UgqYg3IcBX1D3ru
 emMXO7Yoku+lotpfZYCGNAQgYD+7VEtP1X0aQqPoR0hj9413n+Y7Itz5DlqEKikossn2KeeFcnV
 TekL6YUiW078vtl2DkMBcQowC6YHgJrAqGv8oEGy6DiT5eUJ1IwFcbuFkvHvFCWgYpxBpBPy
X-Proofpoint-ORIG-GUID: rVUH7cTTy1tHwvDpWzPWSu-z4PlC7b-N
X-Proofpoint-GUID: rVUH7cTTy1tHwvDpWzPWSu-z4PlC7b-N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=945 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_100943_985507_1734595B 
X-CRM114-Status: GOOD (  13.41  )
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



On 6/6/2025 4:53 PM, Hariharan Basuthkar wrote:
> The power value is 6 dBm on an AP operating on the 6 GHz channel.
> This is a very low value.
> 
> On 6 GHz, the target computes the EIRP based on the power values sent
> in the WMI_VDEV_SET_TPC_POWER_CMD. Currently, this is being sent only
> for station interfaces and not for AP interfaces.
> 
> Therefore, add AP vdev to the condition in
> ath12k_mac_station_supports_tpc() and rename
> ath12k_mac_station_supports_tpc() to ath12k_mac_supports_tpc().
> 
> For a AP vdev, hardcode ap_power_type as IEEE80211_REG_LPI_AP, which is
> filled in the WMI_VDEV_SET_TPC_POWER_CMDID sent to the target.
> Currently, LPI is the only supported AP power mode. Since there is
> no method currently to set the AP power mode from user-space, the
> power mode is hard-coded to LPI.
> 
> Retain the existing logic for populating the power mode for a station
> vdev.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hariharan Basuthkar <quic_hbasuthk@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

