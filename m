Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E069C0218F
	for <ath12k@archiver.kernel.org>; Tue,  4 Feb 2025 03:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+KGWqYwPwPCLRgkUh3lwN3keaTQlo7zjqys5L4okcE=; b=AQnpgHnpzvNu9ApAL7yKnYVd3t
	1OZk03XX01ZGC9R2EScce4gXQjTxsa1X4+DM4tb67vadLI8LxVul7oWbSh3F6UEcOR8ncIWWOnHYQ
	mSO+MQZXuN71tTYgrkoWBsbbuiV0AGS+1D6NDOcxIUMREGUZzlwZuMMl5K/B3jJ2tjR3ABgahJXCf
	ugroeZ6eq6l/hEDYMWaYAkx+5QYrgdsgbZ5lT8eOLP6wrqkdRBhqk+dn/axT50+ZFYYmtNDUiK0Gm
	g/vTYpnAtPr1lqj9kHPjPFBn857t3qc0dMB+Jz+4eeebakfP417uVuco33cPO7gLiZKfWOlJRiIcM
	C5ZYuBdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA46-0000000HCWU-1OwV
	for ath12k@archiver.kernel.org;
	Tue, 04 Feb 2025 03:57:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfA43-0000000HCW8-3XIt
	for ath12k@lists.infradead.org;
	Tue, 04 Feb 2025 03:57:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513KQgUS026951
	for <ath12k@lists.infradead.org>; Tue, 4 Feb 2025 03:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+KGWqYwPwPCLRgkUh3lwN3keaTQlo7zjqys5L4okcE=; b=lYRwOqxgi9vYGTE3
	AzprnwZYXS0IMnQekp5oobOm83G6NJe9Al2HCK9r6E3KDBaGDUiQwO6BV9m59mKQ
	7IBsS2CBzWlv7QzETjCbiRsZAWTGtSzCeRu3CagOc+fglXhyDjJoH5o6fxmvCvZp
	jj0pOlaM63Uqw96t8IKcF9byajA8CNCUZeXT+c3FFrprhpjJdJVY+Do/gxYaWpcu
	kZs1QF0otwjKmMVivyUBt7t0yb3VZrSNYi76WLxncFtNv0Md50fC+LGhSpu9Cjsv
	t/ytcG1C4WUemn3ezeeCjAnZGkVrPi+DVJrsHLYQCxoZU3lj4OI4r0nD3JD3uIt+
	IKCoMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k4ufrrwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 04 Feb 2025 03:57:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so9628537a91.1
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 19:57:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738641450; x=1739246250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+KGWqYwPwPCLRgkUh3lwN3keaTQlo7zjqys5L4okcE=;
        b=PJUeIzs0EAW9W/XNepgvcaXHMcRRFmgaS8EP8D7oAPl/yC6JW6SUawyRbJc7MaSxuM
         FGygOVWIY1Kynh+/zexFBhRPw3QzlHzI9D7ao584chW8dNxbg1Q61YvU51lf569KpCv1
         fuVaZ2DmjT9Lj9bSdvZhmwIYFuIYs2SMUGOxATgSKzify1RRpKMxai1XCYXFhYunEZ5b
         97RyymIkaNpLyzJ76/GIkyyQCFpIcBtdW9KJV1fWNW2LP9r2mZliY0wCmYUs6eCK1nDm
         o/cv+TBbVGTXykIkJoC3ZIzt1064uZj1MI5D/MtvspizCOzgbBgMBK91U0ejLUSuQUIf
         EEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6odmK2/ty+p3oIbUfqN08nWfsNNBophVxbem2GEdpS/VE5uZ910AbNY/2QKnVAh2+COowIBI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/lWPMJJ+JZ2kyZipv3398AjqMMbEEtkoboa3UpocRqKdn9aTG
	20ejKkoIJmZ/xLRIZfjsng/lZlrfwUowdPEKbhPpn4IyeFQ3ySvyXjSvmVdGj5WR1i9iIVGJZBe
	5bQk84d83gU5qVeha8NxzJDmyMascpbGHgA+BWU4ZdouN1+dd0fAl12MNokUxo7I6MKnX
X-Gm-Gg: ASbGncsHhGBaMRnPlWx1J2AgiiOonz4o7hvJFxBSYRWDq6Ad/MDu6jo8A7KequeZZQ6
	DLpxvEbi+phmMi17cwrERe2944TVmJH68nFFmY9W7dP20olj0pPSg3ogD02penEFpH0DwnDG7EC
	iM4A4+vl5uFdoClbHZTq3Tr8s7Jj/n+7tf7vl5EeqbSvxHuxcSchFInDx4AiadFQ7SMI9zBO50k
	7It8poCfLN/SxlDBf3S9WzUiaUY+p7ZL5tVh6uDdDykRfkAdWquci5QeR97ysY/ibo39m7cvNv2
	4QdyHaxTQcZPjpIKFOzYQHJKOmLz1Xyj6likXo8=
X-Received: by 2002:a17:90b:1350:b0:2ee:889b:b11e with SMTP id 98e67ed59e1d1-2f83acb06b2mr35467293a91.30.1738641450226;
        Mon, 03 Feb 2025 19:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy/RemzBKRYM7fWRAW7wLw6O3yXVdLv/cZA2LIgDtkrJ/UFQhAjEgAqUMNBkcw/haPZTnmkg==
X-Received: by 2002:a17:90b:1350:b0:2ee:889b:b11e with SMTP id 98e67ed59e1d1-2f83acb06b2mr35467273a91.30.1738641449814;
        Mon, 03 Feb 2025 19:57:29 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbdba2sm12261376a91.40.2025.02.03.19.57.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 19:57:29 -0800 (PST)
Message-ID: <fd7508c0-e12a-4db1-b443-dd4c12ef41aa@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 09:27:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] wifi: ath12k: Add support for MLO Multicast
 handling in driver
To: Balamurugan Mahalingam <quic_bmahalin@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250203212647.2694566-1-quic_bmahalin@quicinc.com>
 <20250203212647.2694566-3-quic_bmahalin@quicinc.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250203212647.2694566-3-quic_bmahalin@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AOmys9LWpdcmaOAsWPhoKuauw0FMul4_
X-Proofpoint-ORIG-GUID: AOmys9LWpdcmaOAsWPhoKuauw0FMul4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=653
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502040029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_195731_895829_774C595F 
X-CRM114-Status: GOOD (  16.34  )
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

On 2/4/25 02:56, Balamurugan Mahalingam wrote:
> For MLO netdevice, the broadcast frame should be transmitted with the
> same sequence number on all the links.
> 
> Per IEEE 802.11be-2024 section 10.3.2.14.2 "Transmitter requirements",
> An AP MLD shall use SNS11 in Table 10-5 (Transmitter sequence number
> spaces) maintained by the MLD to determine the sequence number of a
> group addressed data frame that is transmitted by an AP affiliated
> with the AP MLD so that the same group addressed Data frame
> transmitted over multiple links by the AP MLD uses the same
> sequence number for transmission on each link.
> 
> Currently the MLO multicast handling is done in the mac80211 layer.
> Enable support for handling MLO Multicast in the driver to update the
> hardware descriptors in a custom way to handle the multicast frames.
> Firmware expects the MLO multicast frames to the submitted to the
> hardware with special vdev_id (actual vdev_id + 128) to recognize it as
> a host inspected frame to avoid using the reinjected path and it also
> uses the multicast global sequence number (GSN) provided by the host
> in the HTT metadata to process and transmit it with the same sequence
> number.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Balamurugan Mahalingam<quic_bmahalin@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

