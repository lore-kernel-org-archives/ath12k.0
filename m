Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2149CD29DCB
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBtppCAveQ1Uid5JNlkzsUMEMnNmJzujCp5DJ2xvJuI=; b=gU5uqBitj2dyq1vhiLqqU3tbXH
	K/o5/pzV4YVDmspfmUMBvFSC3an8D4c+CjlK8qs+ekXAA4AmMlXHH6jQ3CLCqz/ZKuCnvLmLSlkwe
	Ez/OhBBl/KL1hSVVxPP23Ft+uHDGOgLgi+BaIOaj28CgkktySfME5bYxacFFT5gnrj2QG0bK4cM+f
	SyKTqFngCHYgyyhdPb2JGpr6MhpFlJ1LbEaB8NnnffxwRu9AejkPAMelVZcFVLRgFsztKsmnVUMoz
	Kqn1wfcX9Ad7ddu6wxPZhGmOqT+E1YlY6Or86VCaZ7bRPz9EQnhfQj+KMNMcOYZo0gQ56oSEySVx5
	FHoczyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWgs-00000006XEm-1thi;
	Tue, 13 Jan 2026 05:11:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfWgg-00000006XEJ-1eGE
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 05:11:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CN5NhY2879904
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBtppCAveQ1Uid5JNlkzsUMEMnNmJzujCp5DJ2xvJuI=; b=K4lTJeAhR2/hxKMd
	z+tIBixE+ljSp/75RHCUB7vl4BmlcAhrDDSrY4JPeTZOsurIORQiepqkL516R0Qj
	4wZn/Zs/Fq4vNtiF3iOjvqvvJVddslm+bPMzDuSBxE+dfEXzxB13RgTo3846O9gm
	Mg4or7fqHa3DZr90H22TuLt7eY0blR95H2gRfOwPv354PCIz/XrGFB2izQ+PRh3S
	vaLeCAF2dOxVlvccpPm83d56tf42mAzzQy+fwXXbvKIppPjvEc/5cL+e3eBmkxuH
	67RLh28guP4cT+rXTeDr4coF6suAmEnlJcjNDgpZl57hu5UweM6xiS2EbX8qTHxP
	jU3nLg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn5tjsqpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 05:11:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-81f3fb8c8caso5138513b3a.1
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 21:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768281083; x=1768885883; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBtppCAveQ1Uid5JNlkzsUMEMnNmJzujCp5DJ2xvJuI=;
        b=PG6PiVBaLFALKj7EABC2h2cGAkb61lj51rap8519GADvCMs8OPhWsaBpfNxazyicfO
         0CFxjPshCDpx2UMZ91isKovJ+PkyDmCqx2BG5It7yIqED1w+BhrBUHuzZY1y17YnZZZA
         QNiAaHMIOagYFqIQu/BXFdaLW3HbW7mTt3B+3mrPoojgugo0zqQuzoglZwMTZhJBWsCQ
         l3c/gWGRs4C67cgEJJT6+2bfm4+hEy0mf/MYRzwcGtcdIuqw16slDc7385c6C+OfZaA3
         DnvICRP/x7IPteyp06f6KqfN8vTwNKoIYbiyf/hm0WkRsN0qLzOau3yQoDG3q4hrhwpw
         3RgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768281083; x=1768885883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBtppCAveQ1Uid5JNlkzsUMEMnNmJzujCp5DJ2xvJuI=;
        b=R+vpAe/6lrW4Kl+VGIMMNPnCEcYE7xgnudfMrR3lUSt1bj7FVP2eOck/vDQ+uxJoQo
         IFL8ZNm8MvTXOnar2UeH6yee6qXLndKVQfD2n+IubI/kgRS3CMm92bId0LJFA5EcoodQ
         4k1gjHNJPqQbUbOpo2FZROrQL9Uv2PxhO2Od8LrmswepK6bV2liBe1C1TGKtQPgrubcI
         GGcyvw723XuXOffol/B7/gK5EP35RkEXOyIS0uwSyyWlBUQK20LObtyLFV0nb7VUVZNo
         frXKYc1etpBToawIi8Udh4uBcIyN94WgHjU2wvum/gFigM82lzsdewe2oi3goPw3l2B1
         ulWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkYNRYzqf/mJXskqfqqSmqgRsugQ6lhjXepH38ygyTqpfeAJpDyRBVcFypxp7kLzxB1VBoqrk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBHtK0gZvM8GoBrc35U9sSmzQKVL6WtnjNNQRHfnKWlIEiyJzE
	vuLs+ckntHQzNbk7pMrIUxisx4Fs10gLAmhs/+mHSzR7wSqE/hX/RZAtTzl+m4AkfjikBsnLa86
	5otngBJVq9dgtiVNOD0rpgTAolBtd4iNx+0i4SneHoSwzBSnMf4Qjh3UWJfM3S5Kr
X-Gm-Gg: AY/fxX4iWplrV53q+cbqJ59TVQKuQvk2l1By1YqAp+IKNf5bcEd4o92I7ffzX/MQRfL
	wTeUdwDCISJxiQSbyNJVmijbBRoWbqzrgAQ3yyP2zTJ/semfZ8l+sHoDEvXI0CQubkUTIh3HCqO
	/3nprK2lmD21ctvtgpj2ixxrBdbfOeu+M0qlTyixmpguW8k91V1W6vWF3IY2XOKxGDliKC2Oioy
	hC6RPDtJUtqBUVMkd/BD7o9dK9MbuWD2rp419SJQOalU7VFlxdyn5sr5Lb7/q5fgajzaDNmsyhS
	RvpecVigCMgZPEO5Abk8jFcVzcMtLT9ZRN+cutLyPam8uHFwYUPPqyVL1dbazktStd84lylhHep
	Jz2wxMt3YHehlN97Y0YMFre/vBQYnpp25VORgvB9tnhPvBayEJKN4SWI=
X-Received: by 2002:a05:6a00:ab85:b0:81f:1a4b:bf55 with SMTP id d2e1a72fcca58-81f1a4bc2a9mr9778126b3a.39.1768281083029;
        Mon, 12 Jan 2026 21:11:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDHv7f0wrNtF1qGXIMOXDmX/R2MaOCjZgdxwURFTbtrFHzugEtGOQ7flYoG8agbbhXmc8CLQ==
X-Received: by 2002:a05:6a00:ab85:b0:81f:1a4b:bf55 with SMTP id d2e1a72fcca58-81f1a4bc2a9mr9778109b3a.39.1768281082514;
        Mon, 12 Jan 2026 21:11:22 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f90c0sm19106329b3a.41.2026.01.12.21.11.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 21:11:22 -0800 (PST)
Message-ID: <badf5d1e-0b11-4f8b-bc08-d035f139f7ab@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 10:41:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix dead lock while flushing
 management frames
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
References: <20260113-ath12k-fix-dead-lock-while-flushing-v1-1-9713621f3a0f@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260113-ath12k-fix-dead-lock-while-flushing-v1-1-9713621f3a0f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CfcFJbrl c=1 sm=1 tr=0 ts=6965d3fc cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=P4Ze_JGZ0aiUAhR9NtAA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0MCBTYWx0ZWRfX4zsrfpzRjhqr
 fxZrsA02iP7ZIzRKmqkdlyA05ljzBlYiI1WZYkYlCl4sHzUzke7FiIOIHxSKnAFhf3awf6MkqrF
 FEF1x6UvcdgxDuKxfe5n19FFyiUmcWU2Y1r21Dvt5ZPdo9Hjc/qJlKK0CxDZf0F+x6tJeWG7DKE
 ppAmdfk7JL8eoJNeUHPfpxhVOSeKBaPJCt+Bvpn1eH7+FOdqkn0dAgBeMqM6a3TX8ZReaJfc6Wn
 bSl+3gT1PJt5uIjFxivwMuQM1SM0ZJhkYdcCQkybw4uu1cC+nOCOoG1dQOcmuwGX317n7IF0Xda
 nrBf0hr++MYhzZadFSaCSYSg9Tf/uD3leeH1LxiX56cKRWpCWepMOULotkzwdyE0Pl5mxiY15EE
 FR/cy065LQm9d81Gdq9zeoiD7ub6/y3qVkWDijN+SXK1Lrby1JcCUENVCPFzVjnV1uS6hZsjJw+
 oc31/L9l8+RiBpBI0gg==
X-Proofpoint-ORIG-GUID: LaVqPfIYiS-HTzx13DMZPBwV4QFrFHgi
X-Proofpoint-GUID: LaVqPfIYiS-HTzx13DMZPBwV4QFrFHgi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_07,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_211126_575164_F9AC7850 
X-CRM114-Status: GOOD (  14.46  )
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



On 1/13/2026 7:18 AM, Baochen Qiang wrote:
> Commit [1] converted the management transmission work item into a
> wiphy work. Since a wiphy work can only run under wiphy lock
> protection, a race condition happens in below scenario:
> 
> 1. a management frame is queued for transmission.
> 2. ath12k_mac_op_flush() gets called to flush pending frames associated
>     with the hardware (i.e, vif being NULL). Then in ath12k_mac_flush()
>     the process waits for the transmission done.
> 3. Since wiphy lock has been taken by the flush process, the transmission
>     work item has no chance to run, hence the dead lock.
> 
>  From user view, this dead lock results in below issue:
> 
>   wlp8s0: authenticate with xxxxxx (local address=xxxxxx)
>   wlp8s0: send auth to xxxxxx (try 1/3)
>   wlp8s0: authenticate with xxxxxx (local address=xxxxxx)
>   wlp8s0: send auth to xxxxxx (try 1/3)
>   wlp8s0: authenticated
>   wlp8s0: associate with xxxxxx (try 1/3)
>   wlp8s0: aborting association with xxxxxx by local choice (Reason: 3=DEAUTH_LEAVING)
>   ath12k_pci 0000:08:00.0: failed to flush mgmt transmit queue, mgmt pkts pending 1
> 
> The dead lock can be avoided by invoking wiphy_work_flush() to proactively
> run the queued work item. Note actually it is already present in
> ath12k_mac_op_flush(), however it does not protect the case where vif
> being NULL. Hence move it ahead to cover this case as well.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 56dcbf0b5207 ("wifi: ath12k: convert struct ath12k::wmi_mgmt_tx_work to struct wiphy_work") # [1]
> Reported-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220959
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

