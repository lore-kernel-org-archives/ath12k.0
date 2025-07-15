Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616A3C83F1A
	for <ath12k@archiver.kernel.org>; Tue, 15 Jul 2025 03:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yMVrUUJC69aM+MZi+poTcsRqHni541x751Wa10f+gIc=; b=iidL0DOemu15TpfgPb6sORSR+x
	lJXdIhDsStcaY9q7GsqbmMgSQ1nNdBRdL5E488ZyOAjKC27Xg+Ro/8WfvD8zVPfgPB+PphiEuQLCw
	jefdc0PhWg5MRE+EBTHjDbsDQK0mCUVqppUJT1x6s7wF5sUUoYOurrrC/XHWZA7JWO5Da5WcJO2qp
	PPbp6NQtEfKKUhHGt5+w7eVcGNPIlvVQdGniV7ApDU7zHIFzoYmkTaKDkrJTYDe+Yp9qAzK0DuF56
	DOXebTK667JH+kR0iNzZ6RW4vqzsx6ztrcgYMRbOXko4+dOQMOsN/sEvFLur7L6KJGda3dpZv+uqX
	I8Jl6t5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVuq-00000003pmk-0LSo;
	Tue, 15 Jul 2025 03:01:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubVuj-00000003pmB-1L6a
	for ath12k@lists.infradead.org;
	Tue, 15 Jul 2025 03:01:10 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EI2Jhh004719
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 03:01:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMVrUUJC69aM+MZi+poTcsRqHni541x751Wa10f+gIc=; b=VJjDRhTJtkcth0RL
	c9uSyMZogBGNnAT1277RPb8a8A8E4GTiXct3BWupmN1CnXeAJ/tqKQ6sPDh05z1F
	xBmsTslemfADuGNx0zRZfY7hYEU/Bepre9Z8jtT+Krx0DAFiZ0b0vMnOmxKT2Gay
	LdmjlvsovLAR0GZEJnN0SL69jqyKNqZk2k2baJcAP8PLWxZlTm3jWYSziSLgG9wf
	UCrSo4nMIJvYy/PviOiIPVaJpwTXi6tGejuxND/fN1n4DtSzPDcfkTBGaofp8qBC
	yIxVmNNuJnuslyM+0AJUnC5FDzopUPPYmyaOQgfzNTECXuVv7/kmue7FPneV2JQf
	Hku05w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ugvmxxep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 15 Jul 2025 03:01:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23689228a7fso70904715ad.1
        for <ath12k@lists.infradead.org>; Mon, 14 Jul 2025 20:01:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752548462; x=1753153262;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yMVrUUJC69aM+MZi+poTcsRqHni541x751Wa10f+gIc=;
        b=t1nK0wR/IE00+5vohEhThauG4PVTQGl98OXFLAwTT9xwY062JVve+HgMJcADvW8uR1
         U01efgxKJotfcBcQAZPLANvGAY3SNOQvBpnJjOQm3tZQIa4yO4VWVbGT84c2X+Z57sEb
         ZKEWeKzQXtOS6UowMrL0cvW6XC+TT5+c6FpjF9sdOTTp+aRUARmiA72oRxwA3SCnp5Va
         H9UjN61U0EiEEbeoDssfAwFfl8KV7vCtqfqljB/EBr6A45xxZMIWEu+aF8PFNBXHQUD9
         OpBEvaHzxxJRa4lKNwNs5i0G9Q2fiQ58jCcCCxcBmDADEmvY2DbiKI7B0v2yxF5xHOT9
         u6uw==
X-Forwarded-Encrypted: i=1; AJvYcCVPN8UkYtfaqmZIIgIzQl2zznHd2Acz6xxS+rk7smIlP1fc4iX6VmiBuiSpa8FZWe2zLAsSBmY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywck1ykGT99nJqlKtTzwbe4c2UDcFlvd9Ab8yYNEpZj1UT7g31f
	/hfYoGSSVGlebhrSTdyoFYIJdfq+/UIaNg3b7e6Gt8W+/VSDpXwIzZq0XW1omdpefoLfs/LfpM4
	D1hCEPZbLXpPPNCzDNb7xiAIh4hlKST01Iu24oGk7Esz1nwlGzHZ0qkiBFrLjt0/d
X-Gm-Gg: ASbGncvKhpCZz+apnaXNB9s6YlXMOGZ9oORUowOVapWHHTo2yzq80kbieHXQGkdPRO/
	DGEKe+eUCWcKVpNwAjjtZtOEKN2DbVbqu5AT//4fFd+mQvmF/kNN0u9gJ9crApFW2m7FOBUCpz9
	goDoEjjQZLU4MpQOaoyi50ikCDtWm3dLyGPaEFKDiWZzAtb22xozm1p54knK+69BSaeydUdM/Bp
	/jwj5VFd9tf0v7mQPaKk+zZ5jvbp+pUd6eC5hilgekDbjQF4RgL+jAOOB7QENvGcfdn8LDN6m1k
	aC92TCo/ZnzNUelegvK/OAXpQjgApXzhcmfbQz0pyL03WlJJ2J15X5up0d8bOrQ+kBiqk3n5WN9
	OZB2w36JFbXfK
X-Received: by 2002:a17:902:d492:b0:237:f76f:ce34 with SMTP id d9443c01a7336-23dede3869amr212021005ad.15.1752548462025;
        Mon, 14 Jul 2025 20:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/31uXj369rvnVHrjBXgX1NxDdoHWNI71i1vo48vvCgkenQvNS+WIUo0oIjAhO1qCWoufEJw==
X-Received: by 2002:a17:902:d492:b0:237:f76f:ce34 with SMTP id d9443c01a7336-23dede3869amr212020685ad.15.1752548461565;
        Mon, 14 Jul 2025 20:01:01 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.226.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4283a81sm99247935ad.27.2025.07.14.20.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 20:01:01 -0700 (PDT)
Message-ID: <96e05fd6-6fcf-23b4-9def-1ba6fdd5261e@oss.qualcomm.com>
Date: Tue, 15 Jul 2025 08:30:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Use HTT_TCL_METADATA_VER_V1 in FTM
 mode
Content-Language: en-US
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250711035420.1509029-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5WPAmaADYxf5vgZnXnwUjrrDSXBqpC7R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAyNyBTYWx0ZWRfX+5Vwnw1MR4f9
 My1C+vixb7jWDEuihtILElhmP2QOVavkSQubrcF0/GMg01G5wU4ezYe4JyGnsOrOv6cKvKRr9Zo
 l2gb/JOwXjJCkLC389eDm4tJ9ayMUyCe0ztUqxem0XgFhNshlfHxWCe+HjVFEp+49EAYic+kuAy
 YxkPEgunaRb6/gknMp6yUMmRCAz+BITKZK+KOctwAud5IP5wJz1+zsdXLzWpQNbTumM+SjwYWd6
 QlZBocOQKLF3dIx3EomK4nwvZ3C22EhSDzUCUvlHlPZY+KLutEab5RuFvVqLMbEs9qej/VIIlDG
 gfZ6tQJQ6LXXpqXKjfNc0t17Bc9mfvaPXTu6kHr+SO0+EgPhxHqXAK2xrb6c1/IaagbkB/yz4ea
 UJ0S1+huaNRgyiuGSRg+phXSx0K6k1XwS27pqxFI8NSgZVOGnhj+H4/vFz1uQVgXVCJP+Loi
X-Proofpoint-ORIG-GUID: 5WPAmaADYxf5vgZnXnwUjrrDSXBqpC7R
X-Authority-Analysis: v=2.4 cv=C4fpyRP+ c=1 sm=1 tr=0 ts=6875c46f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=bFupCVmCsjxzjGptNxIE4g==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5bc-JWag2cNjQzrUM98A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=873 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507150027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_200105_367899_688AE78D 
X-CRM114-Status: GOOD (  11.19  )
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



On 7/11/2025 9:24 AM, Aaradhana Sahu wrote:
> Currently host sends HTT_TCL_METADATA_VER_V2 to the firmware
> regardless of the operating mode (Mission or FTM).
> 
> Firmware expects additional software information (like peer ID, vdev
> ID, and link ID) in Tx packets when HTT_TCL_METADATA_VER_V2 is set.
> However, in FTM (Factory Test Mode) mode, no vdev is created on the
> host side (this is expected). As a result, the firmware fails to find
> the expected vdev during packet processing and ends up dropping
> packets.
> 
> To fix this, send HTT_TCL_METADATA_VER_V1 in FTM mode because FTM
> mode doesn't support HTT_TCL_METADATA_VER_V2.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 5d964966bd3f ("wifi: ath12k: Update HTT_TCL_METADATA version and bit mask definitions")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

