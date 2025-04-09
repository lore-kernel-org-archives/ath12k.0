Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99446C36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDX8YJzyiVNIZEne3diuCHe0nF2mXF9Tug0+bsBWuy0=; b=B3osQqm58FYjYhcKEGmU3hFTPx
	c7yDYOJARHKPEtW4TSArim3Yp3D8WSEZPk7D13i6hdYzhuhPGyW19Qy7LwA0XD8nkvKD3yrYJI/zG
	Z4IrPbcwTXAr4HbwDRoViTo8qoqUI/RSjROSGLrsyBHXG5QYXrzVqUSYFbw/iXl1Tnq1ucjfPf5Yy
	TffqEJ16NSYoNzNoT9L17vnfGlWxZdGyHMMusRW2kkNiBn4yKJ7+owq5gcUw+OmC2SgwiGxRUfZRR
	NbcWG7nkbhajkSV5sgRcDBXTak5RPr7qfJET0EVx3xt1vPt1WLV92Ts8gAHaumJZFYFq3+iOO6+U7
	zQNAf6XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PO4-00000006LIp-1ayp
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 06:58:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PO2-00000006LHk-0h8z
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 06:58:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZBa9002547
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 06:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDX8YJzyiVNIZEne3diuCHe0nF2mXF9Tug0+bsBWuy0=; b=pIxa1fdhKIr0Kgpk
	+HeLISnTAsY+Ti5SUVGpRJ3q12+3+3HiRNClCFpXIw+qgyMWRSULHAJQu/9uQe1U
	cBFEp0b1tVN2jvy16ajZlr6Rc24T1YxaQRiRXonobdZzTlsoXENO9wfWTZ1gKAgU
	oGNRIKcR4r0UgLUpt0giUEx3hwVL/9W8QESEvj0mK6C5ngjHcmopxJaHK9blv0nk
	j5tveVx//z0zW3TwENVe1twEHPPv/2vPSXw6LBO48rnmtrd24vrXTQ0ygiDu5Ifw
	3hWOod5LP7GFxhm+fDvWd9DFa5vbcH/dbj7tUoRTXTdnEeZyKCvRRVi7Jo0fbfZQ
	3i6VKw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1j8y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 06:58:13 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso8175228b3a.1
        for <ath12k@lists.infradead.org>; Tue, 08 Apr 2025 23:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181891; x=1744786691;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LDX8YJzyiVNIZEne3diuCHe0nF2mXF9Tug0+bsBWuy0=;
        b=P3OwKM2tb+sPZsbky6p+UA/0Ou7eDx6Q1MKuadl5EkuM8fLNwjBSzLRBRMHRzGAiFx
         ecUp8ZF0Y0SfGc5rGGkCYqqrZbaipdo74QeZGwMTcQoiRQQst8hJ94SUA0w+P/cJZh/M
         vHp6wb/ipZxl1NtXTKti21WGsG2/fPM54FZyTNVfUNjXisUJSlANmtPcoW9KOZ2yIFmo
         ndCxtKUOl5H72iNMrC33YU046RaSp5bfaGM0wPknTiCBxR1kMtrXeGeTxpXyiD/J4Zoo
         UyaktPi6bp6gjJJNcKOIXPGVilqbOrV5DNfNNMSzdzgAhXSMtcoBu4SrmKlt77k1Q0Hl
         AiNA==
X-Forwarded-Encrypted: i=1; AJvYcCXr0lQaIfwVdr6jQ2vkb4KJP68E5iIJalfO7bTxLxMYkVjwzyf8VwytFgAqo0O5oc82L86+CII=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3eA/FmdQca4+kKNMUMR0/hvow25Pqq6zWFw3pWLWzlYdWkX1a
	IVTLZwdmYjghQ98VrrvQmTtSwW9Y2yzpEF5RJT1MvR3WtGGm0cVtYTilN0OndwqqSqpTJ0W7Ra5
	3K+6SBaBV0fu62URJDtVt39n5lnjAN9R1fDu+xJGNwXyW+unawwqz7QnteoJKB2GY7RMc
X-Gm-Gg: ASbGncthcn3WlxOIT6qwHRIz2cUi3K5QRXdSenXfl1merFgIKgmt1r1Y0ktnnnHIVFC
	AICzkPYAI4rFkCHvKSuzlcwhEmlGW2l13x+Tvu9fflre8TrNKLCmNTiZIie5zes8axFwxpr4WkH
	kQZ9nB+UDJAmPuGPPaNvZEz3uUgCzWK+xdoJ/CSEj7MLHyAhFQAiruyyMECTE/Nzu6Q9SniogEd
	F16FXWmzMuBHdDzvZbyDlDlZU7/6+AqDrzscOlIklTK0puTQdenStJfM90C4ALg/Gyerjt0FX6W
	bK6dErrTBeWW844HzMbzUJ2IhA7+t5YYoh0HHAVGIFEQCXfNcjiPgw==
X-Received: by 2002:a05:6a00:2408:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-73bae496ce6mr2718138b3a.3.1744181891161;
        Tue, 08 Apr 2025 23:58:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+lRENUCiHOAJoETYT0kQNEPx+s9B4CvJPFLRQNt5kQrX1sc7+PSVrbp1iVpvNthcUFGQxEA==
X-Received: by 2002:a05:6a00:2408:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-73bae496ce6mr2718107b3a.3.1744181890699;
        Tue, 08 Apr 2025 23:58:10 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b20esm549148b3a.2.2025.04.08.23.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 23:58:10 -0700 (PDT)
Message-ID: <9631a28c-f21c-5128-e813-9fab656d35a5@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 12:28:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: replace the usage of rx desc
 with rx_info
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250402182917.2715596-1-praneesh.p@oss.qualcomm.com>
 <20250402182917.2715596-3-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250402182917.2715596-3-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1eFtpXfvzVZwRHqvfXMPsDujL5CXUKq1
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f61a85 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=lXdbdz2q_JjRoMiL39kA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 1eFtpXfvzVZwRHqvfXMPsDujL5CXUKq1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=631 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_235814_322627_F8B23FB0 
X-CRM114-Status: UNSURE (   9.21  )
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



On 4/2/2025 11:59 PM, P Praneesh wrote:
> In ath12k_dp_rx_h_mpdu(), during the undecap to native wifi mode, the rx
> descriptor memory is overwritten. After this function call, any subsequent
> accesses to rx descriptor related memory yield invalid values. Fix this by
> replacing instances where rx_desc was used with the pre-cached information
> in rx_info. This ensures that the values populated from the rx descriptor
> are accurate and prevents invalid memory access.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Co-developed-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
> Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

