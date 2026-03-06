Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4699EFCC076
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 21:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjxfrEWFkAbT3xqEqxDAk4ddlywOSqsux0Qe3fMqtZg=; b=kCB151hFFRMC9iU/jkFvJbBn5H
	vVoOQWyYJO1HacZMldBH/TUtDyfvChc8VQLovudzsUkK8DvKk1ZaIbpd2QtcWabxcQTHgOh93wfxg
	2NKn66xaNLkvqobAX2shicXvRdZvZYSHv7OWeQ0s+m+Gga3YaA8mMOiVhtmRJbh25umkiad+FZmAQ
	NAu+7u8PnRnZxHTZPqrL5o+vgCdFQ2WQM2sDSWAndH9UxaCeuIPTPo+3p/p0laJ+WX/8tZBKFJVwT
	R0t7/GF/L+ht+GmX6xO53faEgVsVNU9VUDyres26B8PipFof3hx7WUeNG5AE7zVZC0j/ufrcyNSwf
	f6ywAmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZZ-00000004WCt-3S1f;
	Fri, 06 Mar 2026 21:19:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZX-00000004WBp-0nK3
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 21:19:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWNaA383596
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 21:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjxfrEWFkAbT3xqEqxDAk4ddlywOSqsux0Qe3fMqtZg=; b=OIIkUsJ20OjR6JyU
	6YVwWuaY+FfzsR6fbB42zVZBSKFIg24fqRQJNGciKhwJso2yLZlH5IA7LYJ4NalA
	7rEul9EKPnTh4jEmaUS+dSyU0JJgWjqM9zuYtziutDdJSj1wNH/JyP67aL6ZRnAa
	7S0T7JDnPqZEleM+SkSSYt2n25CdDDlJVpPZrqhqDzutOdnF9XO4wPHt/ChyWaK7
	ppSxoC+hj296NVT66ns/WaJmcLWD5QKYu7fb7T095opPWi0F3G8xiazDmDs+eSAT
	F2TkIFb5NxaRG3z8WiwojuUGVw75RFjCFhKKm5kcoAJiACyDZoRdbnM5knaDU9Ze
	T2Fgjg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9ua73w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 21:18:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2be21146933so7235697eec.1
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772831937; x=1773436737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjxfrEWFkAbT3xqEqxDAk4ddlywOSqsux0Qe3fMqtZg=;
        b=bKJTWbEeEpNOAddMNKUkFhm7Xykdd/w51en5+v6OaKOBIsMQUDXoqhrB6Ij4OEukQl
         t7jp9FL8sbTqPEOTect+oJcFrPKeiUpL41S8vIN7WT3ZzqA9s55fGW7NGvgdQcMlVV/p
         UJWOWTrR+UKSW1q6rd3YA1ZZGDo6C7TXXMdF7SoTfxxlQFyRIUydOi4XNv8j5cmqqOpA
         Ue2+oa5FwZINZSF3qDVZmZK8+JraZzecsym+nP1gGA94Pg5Q9BTpg/In07MtTGd2A/ks
         5NC6x02hltDO41eFi4tX99IbAvsd4D7lLOD0pwKei7S7JrpnXLv8cmyyaZNRGQsKz5Mr
         QhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831937; x=1773436737;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjxfrEWFkAbT3xqEqxDAk4ddlywOSqsux0Qe3fMqtZg=;
        b=dsnwE3MXtIrQKXiruSABwhxWovisX4Djvv6zGXtXZ5/3nuuVMwJb8WbwOP22ZTRmK6
         xbaiwDD4Et/7iEoV1QvYd3LoIVHpkuqkoaURN6+hYhBjxyBWZrZhUZgXVLuYmjLe+67x
         FJo7AS9RSBuq2N6Zk5yk9kvHIjCSEOw56ZJBuxjfJz6E/Pj0dQo8UnBM9YYRwqEjsI20
         TszWHIe3uEXukaTAsDq+AKKMQYYp+KDrmjZKss4wQiLMjg1NPHX9x6I9obmheDIiOm8o
         Mc+WeHHnVVyEzRJRw0Jn/GU+11dSR+LpciUlpoin6SNMBlNDA0KdyoYtMU7cLixzAsEA
         McqQ==
X-Gm-Message-State: AOJu0YxmoKgXyNGeuBlRjUDBNyyFaZcnvy37K3YJIqvrSrMqnhsyH1kg
	LGOY8JmngbaYHNqskd79ThmlNssSGcq4VLqn5ueIuB6y2F0MhR/FqSNvYofdCsl3PaHrFBHySiA
	Y2btPPsxQnr5Z+vL6BdybGGCG3ASy4mw24B2Tf42dwpGBM8UZ3KC3ypdsjU/ht8vF
X-Gm-Gg: ATEYQzwRxBhqDPM2K9NiYb9nlOs1Cz+YTZdWDpVYE6lDMBc85D6s0y5WFknqaSCEaiY
	ZznZPeRqd8VKDfKtUSiNrE+qF/F/J9DdreTYg7Rpfn2sQ5PWt/+/c/QAD7WtpaF1G3FFHqz4QKU
	inmI8IvYsRO+lT7o+Rtm0OU/bdCkwcmRpkrzBPwIZ3bWk1wbxw6sNpHDtKwDD/M80iWe51zVvHd
	CPhunX4rhDB5ocp3P46xgZukHlduM1UWGw3U1g68g+QkX7hwZtlKYuMwW8f6SK40I1Q2zcYjhCu
	3HBJvC/kW2jgx5LX+S1Fowb1HLr+T7V21/nFU30vWQVgcMla5687Gdrsf5WoFdBMHDInd21sI75
	R+ucedxHlxV0Lr3kNhBlJj5sqN2D8TNnLgnLmh1MWwXjM9fQDU27UjTL4dgqEkUiy2mJAIsUnwO
	PW
X-Received: by 2002:a05:7300:f18e:b0:2b7:95d5:3a32 with SMTP id 5a478bee46e88-2be4de931a4mr1383466eec.1.1772831936913;
        Fri, 06 Mar 2026 13:18:56 -0800 (PST)
X-Received: by 2002:a05:7300:f18e:b0:2b7:95d5:3a32 with SMTP id 5a478bee46e88-2be4de931a4mr1383455eec.1.1772831936355;
        Fri, 06 Mar 2026 13:18:56 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm2325124eec.17.2026.03.06.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 13:18:55 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
In-Reply-To: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
References: <20260226041911.2434999-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix the assignment of logical
 link index
Message-Id: <177283193556.1373939.7970041781311586708.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:18:55 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE5OSBTYWx0ZWRfX05gl+p2gskt8
 qt+S9a68QAE36AGRCneK557t/k1IbVt+s1sR2iSNTCTd3/MBoKM+h0yfdQKFGhf8u2c7/uA7uXM
 qeF/jGOiLPIDkBsdk9WS2U5p6NCljfJDTdIazdN1w78q7UuO9I8DQEY+D95inkF7B3OWzRmW4c2
 l0QEjaTO1929zzmWa2nRlGILkSRS+VQnUZXuMDIh4YEQY0trqzkJnQ/JNntS4Ieb7F39UAlRvNk
 CpjCmSfoNgs/xV9lLXLyZ9NmZY2t7d5UOdhPq9GWK8Ara4AMc1u5SkVz3DfpkkkNigdUUMQXVDP
 LN36aZTjlu1aYWKrRE7LLbSEFnu0qJtQS5YWN69vG+ONbA6mEItVJLLP+X5aSiYCXdsa9kVv29P
 nwO9NEH7smtXlvSTDv+mVrZa4F00CWirWjkCwZmCIFpBTTPXY35+qWfx9DhIO6IAIC0bzlHirSC
 tgKnZJYXEBjK3Q433vg==
X-Proofpoint-ORIG-GUID: 0G1HV2iAmE60eS1oJ1iwEgI7aeY7dLbe
X-Proofpoint-GUID: 0G1HV2iAmE60eS1oJ1iwEgI7aeY7dLbe
X-Authority-Analysis: v=2.4 cv=eJoeTXp1 c=1 sm=1 tr=0 ts=69ab44c2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=N4T8r_4O-xmyLXOS7r0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_131859_360897_4211BA52 
X-CRM114-Status: UNSURE (   9.07  )
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


On Thu, 26 Feb 2026 09:49:11 +0530, Roopni Devanathan wrote:
> Per-link logical index is assigned from the global counter,
> ahsta->num_peer. This logical index is sent to firmware during peer
> association. If there is a failure in creating a link station,
> ath12k_mac_free_unassign_link_sta() clears the link, but does not decrement
> the logical link index. This will result in a higher logical link index for
> the next link station created. Also, if there is a leak in logical link
> index as we assign the incremented num_peer, then the index can exceed the
> maximum valid value of 15.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix the assignment of logical link index
      commit: aecb569d7fb689e3e5b0005ca7bd0a2ef28915e8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


