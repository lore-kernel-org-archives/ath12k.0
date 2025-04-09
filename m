Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB40BC36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92+zPAheUU83RIgUZculZ52msaVJUfLERxqhAO6Aa1g=; b=vONobHN1476WdxaEDWiPup2o1W
	RM5zvQ3zX8sqqVWuJS6TiI7E9PyKeGlx0WJqdJZNz8kJT1R/Ujs6moLCtJGHs6SQy2Z4N9s7mZoHD
	BfZjAsZiNweTJ+6mfT2Zx9fr70tiC5DC3/kfcbanO3BW0V2lc+ysOeXRLFNsTScUKyiLFtO1eyQNT
	IWw6adeNjBRr91rm2hGZfVCT/GE59Y+AKf3iB9CCUDwpqI/mUC94eitSmzmVNC94UtwYM4K9yjzBr
	M5ubXChgVcnDynOqrlgJSlKc8uMG1+beC+aURtPioMxOHNvhhr2z6NEJxjTj+4XmCZL5R0h69iY1l
	MC2fYeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XoM-00000007ng2-31Hg
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 15:57:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2WMG-00000007RSL-1GC6
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 14:24:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398Wj0v029092
	for <ath12k@lists.infradead.org>; Wed, 9 Apr 2025 14:24:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	92+zPAheUU83RIgUZculZ52msaVJUfLERxqhAO6Aa1g=; b=cDxA8fIn+/uQSnGr
	gj7lQkRGo89vLW08HN4YxsRdx8/JrbKRnwN9UK4hHJXAT1s0N+t647mwfg80Bikq
	q+wfQQ+NpjEEWkV3CVSoxSf40C/7/UdggcZIdSl0O2jbTJioV4QQ4P3dUOdZbOLT
	mAkgJmpsHcvIPvlQ3vFKdrhqswNYmCdDEe1eBCP010d8FfFDoezRG9+awqu39g2C
	z+ZJxJ/wdVvgvO0uhmxnYzYKlHWwMjQD959uMzZaJq8b455ifSh35D6Et5c1xShd
	Ta0aOXE2dEHYlIYGm03jcxyHEzCLsKkSTbzgN70XMOcWW/lh255SkFY03ArUexXC
	xlKz1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmbh0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 14:24:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ff68033070so6280886a91.2
        for <ath12k@lists.infradead.org>; Wed, 09 Apr 2025 07:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744208690; x=1744813490;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92+zPAheUU83RIgUZculZ52msaVJUfLERxqhAO6Aa1g=;
        b=ck6TtYOiIyJs4OpidK4g6bGTC+pgbZRRnYiOS+ftNzdUG2w/GDe70ZblQ9HERQWFUm
         +UGXaz1tZsFbm+ld6jK005kjf+vqvuiThyWU6f2+M6r7jE6SzxtPwz3WQNJrlv6Gyb7Q
         fLPrZF9/QZGDrkCdBWmccywwLBsivwZjA2xNry7Tps1ef2rkykVEZzXRw0D/2x54vMty
         bohpTP9S5OxVC0JuUmQk8oYFBbCssJrqsoMcpMIsgDel3d23aFlziRBH+dn4fb4xzwWu
         q87mM2ZikYZ/L1JyIffwRJ+1ebVHdFg+0BNDx7Yxb0mOs5Iyd5pmK3Axae1LlQzdagZ6
         f0uw==
X-Forwarded-Encrypted: i=1; AJvYcCXFb9JJX7XuMkF26er0OEp2OVfy8jBGu8Byr4vdCD4VEZzI+5b7fw33JKb2b6jqIyu+MoxM1uY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT8R9B4OoBP+ILrzQu4MNnJJgP6Xh+p/IuBE1pK08prMC/fY+a
	JxKgH4R+OWNjPqHHO5+aK9lrT20pgPiZ4AvPvxeNTpYBnZdSnG2x3awiqrwngIv56Osq2QdRfDl
	OOHVdIU9KlOFalSXIG6q/Y9xBONNKAwpV8Cfzmbo2b8+M3Escen5IFHJDT15P
X-Gm-Gg: ASbGncvjd8pX/m/x4E7NbznyK5Kl0fhV7C//vxw46R9YX+suOkKvbH/59Vej/Z65fX2
	43a4UmxS+PdWbjl3CKg1457UHFJ6XI6Eb+TrWrEB1JQY1nnG9Fz7jk+YolRAIAQWTlh6Ca8TJ9C
	AWMoZlbrFJ0fxLLOm0NhzJPo2kA4tZUNmBxwNHue/aJicxOOQViNC7Vt00wY+4FIWTPLL9AT7yt
	O9jL+2ZN/eSbbWclcNq6yuHB048QFYrvAA0LbWhxEDont3N/XHErd/XYXsp0riAFJikfMZyP6jB
	c/urc+1iFbDFBYZFhivbadUmBaq23QdtkPZJ5yimvzckVAN+/6ZVkOnbyCNid4QFF0Y=
X-Received: by 2002:a17:90b:51ca:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-306dbc2d129mr4448094a91.27.1744208690247;
        Wed, 09 Apr 2025 07:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDnh2yvc3zc9qhOZk7VBH/rYTuTmOSKdjklRkpjCrCyppSRzIqmm7v5R+XjgQ5imdS+ebrHQ==
X-Received: by 2002:a17:90b:51ca:b0:2ee:bc7b:9237 with SMTP id 98e67ed59e1d1-306dbc2d129mr4448029a91.27.1744208689506;
        Wed, 09 Apr 2025 07:24:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd1717c3sm1665833a91.30.2025.04.09.07.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:24:49 -0700 (PDT)
Message-ID: <03cb17ec-3dad-4037-ae0a-4c3646d7a836@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 07:24:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: Add support for link specific datapath
 stats
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203213237.2695131-1-quic_bmahalin@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250203213237.2695131-1-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cnPIEn6Mal-w5lEyrhiw9B5gnVeTsNu7
X-Proofpoint-ORIG-GUID: cnPIEn6Mal-w5lEyrhiw9B5gnVeTsNu7
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f68333 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=6abM9aXEu75qKuWjdXoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_072452_355638_7A6FB0E6 
X-CRM114-Status: GOOD (  10.40  )
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

On 2/3/2025 1:32 PM, Balamurugan Mahalingam wrote:
> Add support to record the number of frames enqueued, hardware
> descriptor type, encapsulation/encryption types used, frames
> dropped and completed. This is useful for understanding the
> datapath performance and tune the peak throughput.
> 
> The link specific stats can be viewed through the below debugfs file
> 
> cat /sys/kernel/debug/ieee80211/phy0/netdev:wlan1/link_stats
> link[0] Tx Unicast Frames Enqueued  = 9
> link[0] Tx Broadcast Frames Enqueued = 78689
> link[0] Tx Frames Completed = 78698
> link[0] Tx Frames Dropped = 0
> link[0] Tx Frame descriptor Encap Type =  raw:0 native wifi:78698 ethernet:0
> link[0] Tx Frame descriptor Encrypt Type =  0:78698 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[0] Tx Frame descriptor Type = buffer:78698 extension:0
> ------------------------------------------------------
> link[1] Tx Unicast Frames Enqueued  = 0
> link[1] Tx Broadcast Frames Enqueued = 78689
> link[1] Tx Frames Completed = 78689
> link[1] Tx Frames Dropped = 0
> link[1] Tx Frame descriptor Encap Type =  raw:0 native wifi:78689 ethernet:0
> link[1] Tx Frame descriptor Encrypt Type =  0:78689 1:0 2:0 3:0 4:0 5:0 6:0 7:0 8:0 9:0 10:0 11:0
> link[1] Tx Frame descriptor Type = buffer:78689 extension:0
> ------------------------------------------------------
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>

This no longer applies to ath/main, so please rebase and post v5

Applying: wifi: ath12k: Add support for link specific datapath stats
error: patch failed: drivers/net/wireless/ath/ath12k/core.h:301
error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/debugfs.c:32
error: drivers/net/wireless/ath/ath12k/debugfs.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/debugfs.h:15
error: drivers/net/wireless/ath/ath12k/debugfs.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/dp.h:313
error: drivers/net/wireless/ath/ath12k/dp.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/hal_desc.h:1
error: drivers/net/wireless/ath/ath12k/hal_desc.h: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath12k/mac.c:3980
error: drivers/net/wireless/ath/ath12k/mac.c: patch does not apply
Patch failed at 0001 wifi: ath12k: Add support for link specific datapath stats


