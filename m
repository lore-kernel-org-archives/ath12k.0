Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E420CA0EC4
	for <ath12k@archiver.kernel.org>; Mon, 11 Aug 2025 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HPavJN1JXAKLGO63gjELB7PlKoDGOekbM73IxvQSpCA=; b=h0CFCMYJb3z72Ymod1pPTKi/u5
	1A7SPWyjNBLs2uHnTSmNmo5osJsCtD9KIsyB50UVRyRSTH+VXCRkKmqBBvMtuvgUI81WoeLmuIXnJ
	0ieDXUEtV7B9l6U2348NVp2EeinC5xJa1FVnXg6M7taZSFhVYFoqOhd6J1kNd8eOvjUKkkJJ1tYjX
	Bj1mFfEfB0Gt1TM2Bv0CaIVjQOwFH/A1cxiEFBYH5+NBtvEu2FERuroEvayZVbJCHD/k124xqk+1S
	503UlKzyRufNEJt8/JZsYuYHB+GpsI2aCLH+2Ooznh4CdrJ1/pdfmyVOFnMf2cGNi4MzIEk/blYNY
	aUoTYIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVgB-00000008Sl5-3YUE;
	Mon, 11 Aug 2025 16:47:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTiv-000000084Gr-1E0V
	for ath12k@lists.infradead.org;
	Mon, 11 Aug 2025 14:42:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dA82013084
	for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 14:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPavJN1JXAKLGO63gjELB7PlKoDGOekbM73IxvQSpCA=; b=XshoSOimrJH7zPk+
	BN5CCDuC7fWL8VmL1cNAHDfi7YA0ziaFTlZ1Jun/HVEgpAGwhK1cyCMzjDl9mtCH
	sQy15MhhF41UaUd+wJGoIMdWD4EJynQ725TPlzhDdf2PgiRYjtRt7tw1X3zg6pmH
	J+Jj+Ysvfa7ywYCLaJoS+cicb7goHUrua7wlJ3kR57tTipL70W5bRKKFG4R69RzJ
	kyMlAfkTk/ZGOg9xAViuXG5lpmukf/mZEopsW91SN1LgetTYVc/S3871ZvaBQcV7
	2o/9ikQhO/5GPqvjgjByCDBeybImXVjLlX+Odmp20PzNW/BghtXlnqiVuzXgYzmm
	TQXifQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmmw2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 14:42:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so5452195a91.0
        for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 07:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923322; x=1755528122;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPavJN1JXAKLGO63gjELB7PlKoDGOekbM73IxvQSpCA=;
        b=SckWbufpe4Obv9g95L+r+Iij4mNAVBVQwlYnNoHBUEMIMXrnC/x5w4ULMEvqk4EBXj
         g5MKF8JZjDRzwE0YFGS3pLQu2psnuHh+FLWab2RM+AF0GBHEOotRVZNKqwI0o9yMhJVI
         1pRdtrBIIaaeyfDd9g4HklzDfKl3LL9BGHMsAFp/rpYEeQK3M0VV5uiGcQ3aD4ZMniL2
         AHbFWi1eN9CQwTqI2htuAI2bHmV0I3Xwrq+XTDgEtEvtGZGlHe6yB9z/Fb6fQaleKbZx
         msqrW2RUrqbWRdkPlpTh6xrPwaz/V2Mz5FjIoZM8uHvIpd+LzkszEoy2b957n9UTZI96
         MC8g==
X-Forwarded-Encrypted: i=1; AJvYcCUFo2WDBsOs7SZlqcOovQGJgF7n56hguiJtIz2E4yV7EpNOuHiKJ7OFFP1VULD3XHSZX8W2XK4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw18eIzwoRCdozCGzrBeUmtnO29/KjzmjG0GGxws4AnYQ86koWn
	5bLuL+WepsX5Nnh7fVeRc7mAcD1//9G5kxRJsMc4wNlIAQm4aSq8tHox7gAIZgNvgZmQv/uM8ze
	WOMSRKJ2HbqYw+A4y1KYncFJh45jyh6l7+GaIH5a/lfhPmfNbNf66HpsJo9HnLb85
X-Gm-Gg: ASbGncswWNie6rL17t8p5jFSNtbG2lQb7B5V2uOhB2P9L8dugeo/+OxXqV2uptb9q0W
	OTsnh1P1gPAyooEynzbFKyjrYO2e0kHxvO+5kx61hTK0CZkfXPxy1z+9Vep+Cmc5IFpgi8nCN/t
	4tTx/3bt6EthkEXkqg0yPnQgFn+L1h3fMi8kpjiOGVHBxZOmeBtAEh/2WCIORN9Hp3MQfxCbT/8
	lWm3+HQ0dz1wuaSAUcKo4arY9SEzCkorR2qEU5dBsQQNGArV6OGLzl3FaLCuyA8A+sCm5DQjERs
	usgpTMZnE2QRT9qGyBbvDrT0QdP8RrH4ZuZMw4g7lm4OIlDlUvGs02p/nlwPBQxbT3sH3RP9yz0
	qz7e9yhqkaVBX0NnfLXo=
X-Received: by 2002:a17:90b:4c8a:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-32183b4382cmr18119219a91.21.1754923322324;
        Mon, 11 Aug 2025 07:42:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFokxx+wHnI1FWtxI6Z9VjKcm+/9GwZcQcD6ajFnpzh8NiDDNwST2bVEZlTcXpreVx7sjUldA==
X-Received: by 2002:a17:90b:4c8a:b0:2f8:34df:5652 with SMTP id 98e67ed59e1d1-32183b4382cmr18119181a91.21.1754923321703;
        Mon, 11 Aug 2025 07:42:01 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0ba97sm31795256a91.29.2025.08.11.07.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 07:42:01 -0700 (PDT)
Message-ID: <5e753237-2da4-41f1-8e73-6633aec60cd5@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 07:42:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling 6 GHz band in WCN785x
To: Petros Christopoulos <petros.christopoulos@gmail.com>,
        ath12k@lists.infradead.org
References: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689a013b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=YEzdOYdMHGqEZcbkDpgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eNH5niYpQkIA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: e-pdewnIB6z6N_dAT-eXAaEvOiF2VdTB
X-Proofpoint-ORIG-GUID: e-pdewnIB6z6N_dAT-eXAaEvOiF2VdTB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX4C9y3ZDU80N0
 GlWwZjBdJWySAwKvRnUHsnM99CD/+3pXaXW47BrAaQI4j3SQJJ4et7yFdOoRzN2tqozpxnsqHIr
 OolN8R3B8yvJ7VbgtrfJaKLhHZvOpqG4ppM9sBtCBTOnU7ERVj3xjpgGZfJr9CgHkQq+5vsM6QR
 XktsE6JUnzgGJHSUxNaKJQQYAmMM8Ls5o5fUnfDCcW+UK19SEqqXBgFp3dhVZRH2+J8HggS1UI0
 0nBXme4i/7W8fDdUpayrA1nm3D4mBOQDqumRHnj2DDdjMuflR5GKkOD5DjW04fU6qyIt+LoVlGQ
 4ADGLz4RmHcIfL3FJcX4V1vwDNn5d7OI+F+pI7RKQiFsxe1WR0AngRvAp7IEqyPiWnlDrPMarCH
 YDZE+mV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_074205_455681_72929F38 
X-CRM114-Status: GOOD (  15.83  )
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

On 8/10/2025 6:56 AM, Petros Christopoulos wrote:
> Dear all, I have a Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 
> 320MHz 2x2 [FastConnect 7800] [17cb:1107] (rev 01) Wifi controller
> with Fedora 42 KDE, latest kernel 6.15.9-201.fc42.x86_64 and recent 
> firmware 0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id 
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SI
> LICONZ-3
> 
> The 6 GHz band is disabled, I suspect that the problem is the 00 region 
> setting in phy#1, however as this is "self-managed" I have not managed 
> to change this (iw reg set or an /etc/modprobe.d/ath12k.conf file with 
> "options ath12k country=DE" have no effects).
> 
> $ iw reg get
> global
> country DE: DFS-ETSI
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> (5725 - 5875 @ 80), (N/A, 13), (N/A)
> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
> 
> phy#1 (self-managed)
> country 00: DFS-UNSET
> (2402 - 2472 @ 40), (N/A, 20), (N/A)
> (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> I have searched extensively the web, found some relevant articles (e.g. 
> https://patchwork.kernel.org/project/linux-wireless/patch/20250401020840.357-5-quic_kangyang@quicinc.com/, 
> which should be integrated into 6.15.9 if I understand correctly), but 
> still no solution.
> 
> I would be grateful for some help.
> 
> Thank you very much.

Please open a Bugzilla ticket as described at:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Then an engineer can be assigned to assist.

/jeff

