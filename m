Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7AC3C369A3
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d8oSYYU5syqS6jNmAv8fjLJdAjH27s7W9i7bV2ZZhRM=; b=1hguMsOfUOCDc2fx73xVJuD87f
	/POMK5m9uSfYH5cvd+g+c3QQEIAPlhIL4kTuAtNXnxghJH5N1oyRGJt+MMwTU1cRqZvhhiUlX7999
	KW/BCsMLln/0e1rZAtoIf9o687HsMrrW50/9Xhe/2q1fd5efqjA4QAUtAkhg1/iiwVFCp0C1hzi9F
	ruMqqVw42UNrN58JJzfEa4+p6oWcmw6LVNQYBaacEta0t//HCpw0Y22pZxvuWxvT2kfXysqOqx0wx
	nmGj5AqzW4cBamXk95ACpkQEOhc2TNuJKuPp/Oh3w5XY1ITLLNT2swwS2b+/XntE4TR9KjenX2IzT
	nAvwLoNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pAG-000000018GW-1oYB
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 16:17:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oKV-00000000wbq-2Rvs
	for ath12k@bombadil.infradead.org;
	Mon, 07 Apr 2025 15:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=d8oSYYU5syqS6jNmAv8fjLJdAjH27s7W9i7bV2ZZhRM=; b=l98ngNNYaC8KLNToQqycplVGNJ
	SBN33aEfD6hSNk5rFW72ijIbTN52y1LLZSDki67zx3pXkXLx1VaTBIarnU3bo+lfikIsABxHKiH/u
	+OpxJCLGi06GFd/Ed1EQSvjnODEHurTeCoWOJxu1QCY5anJLETYtX5flu505TDEcikwdGEeYgrT3Y
	w+1iJEeI/g2Cd94Yn2AYZ5A+0X9LyuDLxhnVkiUPUz5yMSsJDmr4pS1GKPzCNwiosho68PDaPPvLz
	/hhRdRbfu/tsaMLZ5C6MmUxYjPbtfIqr/oSvQjF/f8iALHs6wIGxxCtR50d/U68N0DLQjYyoHprsR
	l1HLGE4A==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oKS-000000080y2-1Us2
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 15:24:06 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378e3Vt017727
	for <ath12k@lists.infradead.org>; Mon, 7 Apr 2025 15:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d8oSYYU5syqS6jNmAv8fjLJdAjH27s7W9i7bV2ZZhRM=; b=PL46n7yc21RHhGpl
	U5ZRI6dW1G+MCzL0bZYsQeI9Y5ttN4t+rfRpctdZW6XwaiLO598/Cb6H2PGjkfkf
	PeVmEUvmd2O/JjG2JBbHyi0NxzYyl6uSlJLIoMfboi/rmtruUISUlL8KMGg3zZOf
	3HFnk+muJ8ROzt7UXDhxp7Y1tHyqHrUtWpCbjy0ziMGFzI3v6PaP0q64AqKiyobo
	ZhRbqL0tujJLPv64xecq3GoUS4Ii1WfoRpIJxfkCGb76rugo+0bzRUaoq2cknrYc
	TZrC61Bpg5aiNhcbXvd4sBkRhIhwExUrJNXf+JiCcSi6OTW9j16whphBQ9X/va6G
	ErCA5g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3cmxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 15:23:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736a7d0b82fso5884013b3a.1
        for <ath12k@lists.infradead.org>; Mon, 07 Apr 2025 08:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039437; x=1744644237;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8oSYYU5syqS6jNmAv8fjLJdAjH27s7W9i7bV2ZZhRM=;
        b=VMi0JmZd0hStnXzcZU3LNY8uO0cy/t2Gf+sLACGSHnADmra9/ZRj/kAq0vYnj2Bdx7
         jInQnwJI83HFFTWGwDnHFFKvp83CxHNhtBrmfb1F9ngtFM3EJF5TEIlXgfwdWYS0F3di
         efjjuSBFcRp5NeWqNRBLah9Veq7aguotrnMiuoczSSYEBVrIS1X+6we8vmsuKNv47rwV
         taAEvfBOVpCtYXvgJZZtb7Zne5omWKmRCI/ao6ipWfMeeKZ2DuwdyVJlgmZWWVZaidt1
         VUSwHItSvuBrIvQATi6Bb1ePyQMPJ5Jxwlcbt7CXmyAH/eiHyNe7bwrOnUvi23ONJRg2
         e0LA==
X-Gm-Message-State: AOJu0Yy0fjuGaLVmEHz3KX0gI5ShnA4i2rrmeD4+Nb1rju52T+BNTIs+
	9uvXHnsy7vqFi2DAkIe72slja/+MBgT4HSzr+vYax4V75629TTuuUVHo9Mpjg5VgK2V0m6LIm1t
	+VVNRCQHDjS7+71ypdAKBWOANZGfAJQzkXbhySe5p3vOlcpZ3KgO2/lrMasc0
X-Gm-Gg: ASbGncuOOiUQykt+io+Lnu2LBmzMhwGkxDTZXi52KqZLR7aPKNXNGPGBnUwwXljsC9y
	xiWFwriub8ViiA0P6znRU9GM3dj5HLNFll3sydWI84/O06Z++XkVKMag/7AyDPUIhrkUmx8t5F4
	mv1ejVItHRjeYaR1jQUoRMnbac6pJXGJkxoCQe/fFoAvfpEiWe5qrO3CpH4BPjDEmV6Wj4dAClr
	uk9yowkhVFm/3gNJsLsbFSb2+lg5BHuWo9RdgCae63np9f75rQuXPtwy1PTskLfIGNmMIB/9TQe
	IU+sT/t8HuFqra0WYKJRrwiLRFmr/7Oe9hLRTMAxcTxn5xXAQEvK
X-Received: by 2002:a05:6a00:2e08:b0:736:692e:129 with SMTP id d2e1a72fcca58-739e716650fmr19905059b3a.24.1744039437439;
        Mon, 07 Apr 2025 08:23:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1gN18j3H8gIFckK7HLeiPhwiHTMvYoXUGn4A1sg3Yx14JG/17APO/VjuchOW4r/T4RThfIQ==
X-Received: by 2002:a05:6a00:2e08:b0:736:692e:129 with SMTP id d2e1a72fcca58-739e716650fmr19904984b3a.24.1744039436643;
        Mon, 07 Apr 2025 08:23:56 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0e7d3fsm8691592b3a.180.2025.04.07.08.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:23:56 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <praneesh.p@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250402180543.2670947-1-praneesh.p@oss.qualcomm.com>
References: <20250402180543.2670947-1-praneesh.p@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid memory access while
 forming 802.11 header
Message-Id: <174403943610.2068408.12657138094703090770.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 08:23:56 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: N4adPgimii4rrgXdXTf805yMITTjRkwg
X-Proofpoint-ORIG-GUID: N4adPgimii4rrgXdXTf805yMITTjRkwg
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f3ee0e cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=-nT5jZN5E8sRPm4SzxEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=610 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_162404_681164_EE95A8F3 
X-CRM114-Status: UNSURE (   8.76  )
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


On Wed, 02 Apr 2025 23:35:43 +0530, P Praneesh wrote:
> While forming the 802.11 header from the rx descriptor, skb_push() is
> performed for the 802.11 header length and then calls
> ath12k_dp_rx_desc_get_dot11_hdr(). Since skb_push() moves the skb->data
> pointer backwards by the 802.11 header length, the rx descriptor points to
> a different memory area than intended, causing invalid information to be
> fetched from the rx descriptor.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix invalid memory access while forming 802.11 header
      commit: be908d2360341f8bbc982fff5a5e4f8030c17f74

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


