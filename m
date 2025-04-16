Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9547C369B1
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 04:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhUKvNCjRFWyuOdy/mH5/vmgBZi9sPDt+oS3Cxapi1I=; b=gwG5QM5HM69fj6l+Fq2nOQozP3
	fn4Nxyj2hIjLJOXJST7Dz9vmiTrDwWO1fzGlqMf+bRk/VrOSm+rBDUqy3dvBDgUzC4wYRm3hoLMF4
	YIoc2qdLQemAoKRRUAIVWQV6SHHhdG+gSjzTfCLEOnU2/0mcYR3pgWZpq8Nj47UHtcGubLVLMAsQp
	wCgH0c3zLECS3HO67I4MtB1q9ubsGhMndZkV8UAHYvQB0GJz2VkgUOcGzltbPR+K6ze8qoedVQlv/
	pB3X4eMsrc1fnY+EgCz0kFRtFpUwQa1olqLwCZxmaEnQG0BFRVREuH1IbeKJmN5wVSjgGN3E1sJ1A
	ZHEM6Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u0a-000000086s7-0Qwz;
	Wed, 16 Apr 2025 04:04:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u0Y-000000086rj-1ku3
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 04:04:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIW71t013136
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jhUKvNCjRFWyuOdy/mH5/vmgBZi9sPDt+oS3Cxapi1I=; b=ctcIeLDYx5nl8Did
	Q5o+grumf7hdZZG4sa9xHHHOSu5p7k1tRE7SLDMomsZ09IpHsHJ682h16YDeHUjl
	AbZbrki0HBvrad+OY7D9dLBx/cQ34YMFOgfVRXAyU7iKpG2tRF9J3Dpa7qZ6DuTN
	sTjWy6g2WJK/SfPmqVbSVkJtkhWJeH47C6uLU826HADl86yuOCMuIpHUC9tzDxR0
	QsDQwc8Ai9xB6qGcWNRM3dKFz0iZKO7IgGX0gZOiJxa3pgDfBmL9M+e9hdLOTejm
	VS6JqKbHkeE/sfROBh+PB8G6jQ7UivD9VYC5CextJyRSZplXPvzGrLXH7jXweQ+X
	3tc4ng==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6j9b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:04:17 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3916175a12.0
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 21:04:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744776256; x=1745381056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jhUKvNCjRFWyuOdy/mH5/vmgBZi9sPDt+oS3Cxapi1I=;
        b=KLJzFMWjzEKQR+J32TzGffXhURwrssF+mcM5rGTX9i6GjGXDgey0zcL/+HPLPwOqZJ
         exPR9HX4T3evMaBdy7ZoGo3WnhGr0i6cHMUAf19lYlGt1RZBUGHzjNxnA4ViT+TlZtvp
         P3mC/v4hz9SaoIpkCsDthQ/q+hb1p2IEpNCOOM+JLgy+zuwvZc2aglFicL2bRcJ7Dgie
         I+iOlaBXZBPxuC/AJLYHOQSihS3T6GuBSTqOwSqr0PlDkuD48U8B2Gs6QSQ905hpNzTV
         TOAnmuLZLQ5DswIgT3gE4P8ditNpnlIOWvzA7fA20zayEYUxRPVPr/JZL/Z//qr6X8bF
         SVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRwEF/cGqgVTbOz2zVRubCfKZ81AopKyHDui2IAGd8PeP3qMi+Fa5recTfKDLhCYQXNm0v74k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyxNIfxoiaI5e23FOmgV2hbj8U73UBFcMOaG5ErZpCGd5ruzORO
	3tWgfts9D9/doPnFLPXpDQ50lxDRmukr15tcUso3VgpOvqoy9xL1F2p94lYSghLaVOem4G5mGsT
	cLB9adBaMx5M639XpRfB9rQbCRm5C+obx/MFUejLg5YoHA1I7YK3AeZwHW+bQQQH7IIQD
X-Gm-Gg: ASbGncstgxFElfTtQPOipUEQdZW30OBsNbTL88hNjnW+leTKnl4929JLWaCh2WU/ipE
	0tyTX44vXrjn8f/W/7vxurZonjlIld1ySmM0g7cTNvF40lMDhqgNdhDHhatz8mfQbXoaA5xeqPn
	bTdrGVO3z9PuHRICe5kCOXYibIMZykvNWUzCqJVpYY9Vdu+CuZyUuYgF9x53s1clkIag3WsNZXR
	J9LXZT944flYGNrZO2mQp2TY7MjjhHS5RcrBpzgNpIR/xRr8+IStNZZ9V7Xgdwju+E7ii3ERpxi
	UwoSGfUka2IOy+FcPG8mfXrMD3uSzXfVV8beq2hx7WjlfzPdib5OdQ==
X-Received: by 2002:a05:6a21:174d:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-203b3fc17e7mr191946637.29.1744776255770;
        Tue, 15 Apr 2025 21:04:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH6oGs3hEZl+fV32U9ZXtXiZvyQ6spTGhEY40Ibu2s9I/iyZN7TUwOuxmcB+F6pmRKeg2pKQ==
X-Received: by 2002:a05:6a21:174d:b0:1f5:7873:3053 with SMTP id adf61e73a8af0-203b3fc17e7mr191905637.29.1744776255328;
        Tue, 15 Apr 2025 21:04:15 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220c45dasm349041a12.23.2025.04.15.21.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 21:04:15 -0700 (PDT)
Message-ID: <f1dfefe4-8100-178a-2cb0-8ec1cda4337e@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:34:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 1/3] wifi: ath12k: Add helper function
 ath12k_mac_update_freq_range()
Content-Language: en-US
To: Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-2-quic_rajson@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408042128.720263-2-quic_rajson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rgCKq8i37iDdtZ-S_zNpc_lCtj9KgumM
X-Proofpoint-GUID: rgCKq8i37iDdtZ-S_zNpc_lCtj9KgumM
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67ff2c41 cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3K7Z3hTJtzFxHNBfxTAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_210418_484855_7A699556 
X-CRM114-Status: GOOD (  12.27  )
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
> In a subsequent change, the frequency range needs to be updated with
> each regulatory update. Since the current function also modifies the
> DISABLED flag in the actual channel list, which should always align
> with hardware-supported start and end frequencies rather than the
> current operating ones, the existing function cannot be called again.
> Therefore, the logic for setting the frequency range needs to be
> refactored.
> 
> To address this, refactor the frequency setting part into a new
> helper function, ath12k_mac_update_freq_range(). Since this needs
> to be done independently of updating the DISABLED flag, call the new
> helper function ath12k_mac_update_freq_range() after updating the
> channel list for each band.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

