Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C79FF8867
	for <ath12k@archiver.kernel.org>; Wed, 29 Apr 2026 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9FkfAicNK+xxJU0pMDfP1tqNhyH27XrC5vpFh8M2GdM=; b=lBOE/tr6nvaM5aHQhfHzlwunqD
	bV/ihvPeHaMODkaaY9kTofxYGUdRhSmUkEVdQJsosT4wwuy00Im3VmPQ/M2vUaBe6uqPHq2OcrNo1
	HhsjIMOyIFcYhcdA6L4xrx6XJxw1jbpBhIuInfhihubT7ughJh0JkMXdFiMUyipKeS83KD+tutpAU
	vkSxcVsyfhBz+YNCurm+qyii9++ObcO5XM83iFGaNPXetKY5AT57w543KO60yQCXY+YK9dUBNjxM+
	cNYfSrsyZyYryQt/eCcTlCOjUtHwDR2JBrTAMFmsH7pyiXVA7KPeILtpHpzRAwFnLZrPx7ZVy+exx
	20QRFb9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyf6-0000000333b-2Ouu;
	Wed, 29 Apr 2026 06:44:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHyf4-00000003332-3BBW
	for ath12k@lists.infradead.org;
	Wed, 29 Apr 2026 06:44:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T3ZVYY1016142
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FkfAicNK+xxJU0pMDfP1tqNhyH27XrC5vpFh8M2GdM=; b=ohfwEG1enYJL4IfD
	W3YZj9G6eK0Dt/SUFyNq9tj4mwdLioztK1JQ4fLUc56fuq7+37BDSjXCstJZoUDo
	t6Khf4Puam1vb+v/XJ2A7Mh4styly9wv3qanU7hgCyTnYGGznTlcM0UsDpD9LnTq
	6QREfYiGw6v61breFhvyxdatA6Sk1ge4MFIP/G9eq1JFOFnMXRMQ4GXlIxBkI/VP
	MXe7/QVuvF/tIVBzi6OvILColhNVJsVm1rYy8ewLlcoxLhsf+z36AuUa/BZx7Q2y
	Z3V06vL4Fz7hasRspxyyrf75RFJj6HExJ7ZDe19wjKoKwnbhSAHxL81y3MUxerYq
	9GsKhw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dua730kb8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Apr 2026 06:44:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c44bf176so14515326a91.0
        for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 23:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777445081; x=1778049881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FkfAicNK+xxJU0pMDfP1tqNhyH27XrC5vpFh8M2GdM=;
        b=C34Q6GC5n9v6BcBVljrqtRPUJJUTWqPYPbCNYhKUWErxaLVEuiyhsAr73MtsqI7G+6
         ka325QaVooJdyRb9R+Mpq44SES+aY64BdEOAMEOlrPNRfCsOyp+blhOdADdLCq1F0JVq
         i0RG0K5mOuDxb4TYiUJeqvXE30pMXWvdjrsWnM7LPr7T1Iqz3v0aL9/HDU8Q16mhs6YV
         tdxDyfqzv21EpX9PWwKqBQRBhIjm1t7t3vc9cN6MNi88VsZ8jVvtIO04Yij3VTKIScXO
         I/nnOR0CVIYMsO2sr7AysG4aUeYou6Y/z+YJLEMCpWFyavUHk75+a8NtaKSVlj2dQNYP
         8HoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445081; x=1778049881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FkfAicNK+xxJU0pMDfP1tqNhyH27XrC5vpFh8M2GdM=;
        b=p0VsX5HeVavh9jDJFsv9ZC2wwANIZ6qIJPfx2ZjlSNlgc+HUd83CFopDUOwMLaUJlC
         Y1kb01/IuqJgi0A2SxGUKfZmjMapYQOEbpvqECur9K+gr9HtZi9EzJ4bCR+W868wFofQ
         1wfzU13UpCVYiPonfiTaC1MX9od258waQ73bNW7IhUGj98ADU6NX6idZNxxgYGTNCQec
         gNlvwAGtNqzsKIOpLOE8N7tcwYFIuVrKgHxzUDPurMwNvuXvxaAyoA+4hNh7Jv43vdyA
         Rt4fw6XSoQ6vqP8a1ipEJ3uWlHfH+P7z3vqeOQ0/XcYrqqUoLT5hN26TISXcw/xcIzfs
         HYWw==
X-Forwarded-Encrypted: i=1; AFNElJ8VlanmrPDMaFq/SeQcy9uL/vaz9y4jp5GUZ4SNHccV7c/xV3a1cEM91GDkFXT6l++dlb0rIsk=@lists.infradead.org
X-Gm-Message-State: AOJu0YykdhJUC9bccYlEyylqwW0dBdCMTH2X/1P1Acm9DJr6ZAV7p0g4
	K9BGnNgmr/WYha0dRImCf5HlJRGPAkMESUNGeH1UGTEctuLM1Ea8uz0V1mRdFyJaRUC0ljjiz1j
	H0xCqU0DyJf9RaqrmHkRDR0bvR7ls4QcKvY+HLDo5qGF/JTmU9mCSJ243zYO6CeuRnWhygWQ9
X-Gm-Gg: AeBDievdCzBKfcAA6jzy8NGmb7FqlWVMdxGzSD0B/z05xpVnxh8+01xZKlWmezCsuMA
	6tWxpQeddwVRcpb3teA09nGwwsdbMS1YTf3WmzK6a0ZxGw4f9I6hWGFVytEOLEKZmI2FVrsOMyA
	yusC9ozeW79uZOTOOQdjCyXbC5eEQHdNWvcGbchaxItQtRLp3NoljVVUylX29QoOW/UcYLohEIn
	LsqZFk7e8Bfav9chcyqwZqTJu7kd208GP+dHTNyG/vYJfTEFbyfllTlVqRbm7Mx+PouDwl43sN0
	3tTR6N5weqNnB1wvKVNwRePKvY6XFBjAfQICOCZTfDLVMWDFjs378RxVxYlH45EXUa5BmtpL8iC
	v8SckIfUowE9qgGCBLsAP/9VWcdw6AmEmrbmValRcT/XkdgIBMeW0r1rgrUnZBDFVOXV7BfGW
X-Received: by 2002:a17:90a:fc4d:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-36492064122mr6713257a91.25.1777445081341;
        Tue, 28 Apr 2026 23:44:41 -0700 (PDT)
X-Received: by 2002:a17:90a:fc4d:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-36492064122mr6713235a91.25.1777445080906;
        Tue, 28 Apr 2026 23:44:40 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a4180219sm1159604a91.5.2026.04.28.23.44.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 23:44:40 -0700 (PDT)
Message-ID: <e2f56f43-9795-4930-a5b0-d3e21e9b336c@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 12:14:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix peer_id usage in normal RX
 path
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260427-ath12k-fix-peer-id-source-v1-1-b5f701fb8e88@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260427-ath12k-fix-peer-id-source-v1-1-b5f701fb8e88@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtvK/1F9 c=1 sm=1 tr=0 ts=69f1a8da cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1ZjfdqP5A_V7aTamSN4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA2NCBTYWx0ZWRfX8d+eJ3lMK5YA
 KcszpCB1WDlenVn96NetyvYiXBIddBjBlAJuu2sV828orCdZPmw9nhfIa7M1V5KmkU5KPHDzqAd
 P4AQQrvjbAJIrBRWLWCWNeN8+szKi8HmCBCnG3XoGFGTslExpnTY9rn0FeYxsURSNCJ/thTDXwi
 YUMQYP2oJNZ4mg2CdIhC6xVkV4r8TIUxzPfDlIc8NXM/xJ053WXykCyhgo/KxJKVQtRr4/bVKJU
 KltyPdWVfjoXK6aqhC+XVfOsyh10oDshC/f76jGBMTGMavooEkiAyxlYN1oeMpnToQ95zKiQdqK
 vktFxyrPKdgXVSURNiwTgrNNr3tLWRWPmuoYxSLYo/tsagtpi2Qp8xUgXORc0Y+nBXDeepm619n
 WjliQdvmWfMO88LyUvXx9WIbCk0IhHQHF5U2x4BK+Izdqz4SGIi3gAodZ2YgNY+DTMDoJCqS64Z
 QkrJuYWpaDL2NcfsRLg==
X-Proofpoint-GUID: lXJNWOgIykkk_fFDXoLWu-hahdHJNOUc
X-Proofpoint-ORIG-GUID: lXJNWOgIykkk_fFDXoLWu-hahdHJNOUc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_234442_804833_CECAA759 
X-CRM114-Status: GOOD (  13.80  )
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

On 4/27/2026 11:21 AM, Baochen Qiang wrote:
> ath12k_dp_rx_deliver_msdu() currently uses hal_rx_desc_data::peer_id
> parsed from mpdu_start descriptor to do peer lookup. However In an A-MSDU
> aggregation scenario, hardware only populates mpdu_start descriptor for
> the first sub-msdu, but not the following ones. In that case peer_id could
> be invalid, leading to peer lookup failure:
> 
> ath12k_wifi7_pci 0000:06:00.0: rx skb 00000000c391c041 len 1532 peer (null) 0 ucast sn 0 eht320 rate_idx 12 vht_nss 2 freq 6105 band 3 flag 0x40d1a fcs-err 0 mic-err 0 amsdu-more 0
> 
> As a result pubsta is NULL and parts of ieee80211_rx_status structure are
> left uninitialized, which may cause unexpected behavior.
> 
> Fix it by switching the normal RX path to use ath12k_skb_rxcb::peer_id
> which is parsed from REO ring's rx_mpdu_desc and is always valid.
> 
> hal_rx_desc_data::peer_id is still used in
> ath12k_wifi7_dp_rx_frag_h_mpdu(), which is safe since A-MSDU
> aggregation does not occur for fragmented frames. Similarly,
> ath12k_skb_rxcb::peer_id may be overwritten by hal_rx_desc_data::peer_id
> in ath12k_wifi7_dp_rx_h_mpdu(), which only handles non-aggregated
> multicast/broadcast traffic.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 11157e0910fd ("wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths")
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>




