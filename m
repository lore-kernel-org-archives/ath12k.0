Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E630C43458
	for <ath12k@archiver.kernel.org>; Mon, 29 Jun 2026 07:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3WWEn498wRT2F5GSO0e507MOXabcK3QFPlbhvF3mgA=; b=C5KClsXaAe9q0lVhjdT0uGE2g3
	NbyjhjxfMcAujXo1bB74hwEgV/+6Tsl8AHobRgEJstesVN6GV6ghHDF9Ye2FL2ImHObqeSfFf2gNM
	V7mSPEBiS+9FnYgRQT6RG6WlBQDsjF3VOdeVWt79/TC0QgcHO+XsBI5kCUQPeubesRPLOsgEtysRA
	vmyuWfWJ1RycuSUi1SReuON2qMqoZzNL5BT/skxHjea/MckpHMcI/OqasT2/1aPoXpnWSxVSwku9i
	Tp95Pf9W6m1K3vbDdVwN6DHUDcfJH+UUD1R9rToK7aRkzVdEjPk3NNy2oabz2eunQHjZGGsJqtxiu
	IHX+3wEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Pp-0000000DtEf-18H6;
	Mon, 29 Jun 2026 07:28:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Pn-0000000DtEA-1zVV
	for ath12k@lists.infradead.org;
	Mon, 29 Jun 2026 07:28:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7DqK32188727
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D3WWEn498wRT2F5GSO0e507MOXabcK3QFPlbhvF3mgA=; b=A2ankhgDRercu57J
	aB0xNFHWLyHicORK1TxB9Ce5p43eZ0KVUADJufPPqw9+zLHJ/rbup+RBldyuWY4y
	F972R9/wWM3EEQRSRkuOlfrDIw7EsKjXYK/qs0nxri+mhoxTqWqAZAhJQ1IsU4b2
	6yuPC/1tEEXV2DEk9P2rbz90DSdxwnArYjZcN7xwS4A0I4oMPLNNt/6ytDD0YC6f
	nSGaI5U/VZB6t8kU9+KI8AcawhF7Ol33Ba1KcLaHodAHYpsg3MKa8M5tUFHJXIn+
	f+a6lBiQr1hLBzuzvhAhyViJB5shUj0jlUjFEcDBdK7uF88yH6sunL8oHFFBmEjj
	ldwQJA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tr223-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 07:28:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88cfe287e1so1638060a12.1
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 00:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782718102; x=1783322902; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D3WWEn498wRT2F5GSO0e507MOXabcK3QFPlbhvF3mgA=;
        b=C+cRnEKHeDgMMEZ3EzKpiyqWlCkSl3agThQ6T0E6kZwgO2oX0SOylVNiZYkD8nFXt/
         3QtkzBPFdKGmzfTDtVIRcxWUSGDJDJhlXf+8gF62E3r+iE9qgMtl1wS/kyZsXWSKLufE
         6mqLCJQ3XvpOhsnsf65EbbZIEYv4ZhDR6koq7pw9DVcujmWkqTrmJ1V5oVwOOIBnmdOF
         6wJ6tlV0aFQMAyWLXUGKpXJrDmK7M//6kF542VblXk7opZV+xsmHa0mOJLiTy7FY0wOb
         wUVuu+fbHGFvMuqbKrEsvKA5t6HSOjRsJKKzXZ/JwDSXyOQy0Gtu356K5pjYyrcvskeY
         6AVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782718102; x=1783322902;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D3WWEn498wRT2F5GSO0e507MOXabcK3QFPlbhvF3mgA=;
        b=Cv8lvskkMK0dzco5WlxzJ5/N0DFysMz46ZmTxy/RnSMa6KQcXl6cPVanMPhRnl56tf
         vTyuHq86oUjVZWvTD6lRr8ET+e35LTEOCNS7NZIpB09HaAvhmu7H0vs0rcuUgGAxa2jn
         nZhPZd5X6CrDIhpZ2kQ4OKxb5XuKUX8hH4cuNih2LeIH6psk73k93ZxD0m70B1Rd5G6z
         ia0sw1arbIH3ES3djw5qrcnyu1IJ/IwUE/kjXcubdESH71ZFCzX3s3YPr2Yh9FemUfxv
         8zTmdsRTVrSsdMvWvoZ4vYJ8x3uyt9MhQ77hoLN6fsSX77m+N60KPIR/UVjca3XSagRT
         24Fw==
X-Forwarded-Encrypted: i=1; AFNElJ/utgyNkENbBIBgQ8/04WXhPRnu+asQx1CvpSUxmFTp+mtG92Xn4yWwlzthRWWS7FLE+zHz7E0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzJkzdW8gzQzEMQ7r4bBo3fXLRG/qJEuCMa1rw1kKMwiaDRjmsy
	XS7H/IG72FnyOhZqA74cxRw87kfWqPBFNCFH9sJ+o/sQAiNrXCH7eDdhfbBZ/zz7wIIUSKzBXJI
	UAfxar2saK9wNJXpSkIVjvj2+DlJ1QzzHSXjvN2w5mUG7Yc/ye7gh51vpigbgkJbU
X-Gm-Gg: AfdE7cms0TXeBBELtK0oM9nEKZhNpAhbQYhxeLIZcWP3s7oQ8F0spFi4sn0MCNmn0dS
	mqISu18sVUKw0uJy1FY2ZEYSssde8wSbPtpgR6oCj9bALjP6ecvJIYXjDAOGB0Bva1uZtU69IDI
	BSvsgYr8sKuj+CAjr514fymNw4QaMLcIkGeKmnFPjheu/VI+ZSNUHbJvMt/aA1Ago4kaK3Y9t3T
	dn4gU2UXyU3Oh7ev83cAuskuHIQ7zqWBuwXvImr1XY/j5Q/4bVuvJLii4JGt8Ujg/C6GiFWtOwY
	nUtHSLPK5YbKvXMxywyRdcVncJlD8PIjomm/uBgktiDSJ5wVit+hgJqlmcHdT+5Tf/+Ts7cGIYl
	CrWDPx/YKnUv28gC0wr90KQGwo89DxBNtNuDCFDxhxgDdslJ839nzTHx6vEOev/nHWehjEd8h5r
	5Nv0K4gA==
X-Received: by 2002:a05:6a21:3115:b0:3b4:b24e:27b4 with SMTP id adf61e73a8af0-3bd4abed61dmr15513098637.1.1782718102178;
        Mon, 29 Jun 2026 00:28:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:3115:b0:3b4:b24e:27b4 with SMTP id adf61e73a8af0-3bd4abed61dmr15513087637.1.1782718101671;
        Mon, 29 Jun 2026 00:28:21 -0700 (PDT)
Received: from [10.133.33.8] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40ee417sm10938965b3a.40.2026.06.29.00.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 00:28:21 -0700 (PDT)
Message-ID: <91d2bcce-f85b-444b-b016-572a07742754@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 15:28:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Advertise multicast Ethernet
 encapsulation offload support
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623100501.2100119-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfX9pUa8gc6bzzN
 PJwccc55qZzILx/ppmOjKYpCmX205i9zg151V4oWmUmgfXQ1hI2RRey3GPIHOIW9d/WjuAuea2g
 HRavNL4rEx44iAbIV4snNE2II0/qtwFDS9q8h61xMr3e/kS0gMQnImt4NMUdwtBO4GUBnSjp/Cp
 d2K/AJY0H/42o7fem4LcCsk384aEk55wbqUV1pYipEif1ZyJwd9biLkFzSOCEycKhuf7vZlA9NS
 reJIYp6RPqF7TNxdJKJnBy04PjZ6v+FBH3699u8kGlZzctkh1ha/YLczGOPEjfbWU7x88c2kUU0
 IScNjhbRx+wZIqyYLokkvqqQ6oylfDRM1ejR7DGN6r1hlruILGWPArrzZj+FKJR0MjBv4E1cu3o
 xQ1NLTNRZVkHTc81jh3mcMXe0s1hrTi+IHHFTf43bDQ/d9mQiBRf6BBM9DASFGz0B9LI6S3la7r
 zVL43k/7AsX1x0Qts5Q==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a421e96 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ON_mxGkP88hWkZQB5WAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2MSBTYWx0ZWRfXzx8nU4c7jfdv
 eJ+8xOLvVKgHRCPb12mDyjNApNC/GMnQEr1lNyDoL4AiDWM5vwxzSVtX6nMsg8wJjNg+YKJi25H
 p0wl5rpN1//M6GFwlyriUT2tP26tKwM=
X-Proofpoint-ORIG-GUID: YahFknG4GzmUfCmzevY4Vdc4YXkVC6JU
X-Proofpoint-GUID: YahFknG4GzmUfCmzevY4Vdc4YXkVC6JU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002823_521361_1F331FDF 
X-CRM114-Status: GOOD (  10.96  )
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



On 6/23/2026 6:05 PM, Tamizh Chelvam Raja wrote:
> Advertise IEEE80211_OFFLOAD_ENCAP_MCAST to inform mac80211 that
> multicast frame encapsulation is handled in hardware. This allows
> mac80211 to pass Ethernet-formatted multicast frames directly to
> the driver.
> 
> In ath12k_wifi7_mac_op_tx(), refine the logic that selects the MLO
> multicast replication path. Add a sta pointer check so that only unicast
> Hardware-encap frames use the direct transmit path, while multicast
> Hardware-encap frames fall through to the MLO replication loop and are
> transmitted on each active link.
> 
> In the MLO replication loop, use skb_clone() for Hardware-encap frames.
> These frames are already in Ethernet format and do not require
> 802.11 link address rewriting by ath12k_mlo_mcast_update_tx_link_address().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

