Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF0606A33A
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bMnJiHf9;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jgac6jl5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q2Ph5DsC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=; b=bMnJiHf95bUbku
	7P3S7PLLo5L6E/eFSt/1xN4zDcBTnIRAV8d1nxnAQ8kv1oBUV89Kg0HdIVv9zUcsNyJJ2GO7zyw0l
	D24PnRjkVfgop3pw9b6pnL+J2/04jLxeNF3vWopZLBirJV0QhABpaxRUyexIQbA2g3DF/FEZJD8oZ
	6+pDqMD4AslzFEqwndBunkDlm0c2TdBuYzaPcTL8cuvqj2UBzroJD0oRqfScfhSqmjf6msC9wPGQs
	ANJbQJMd158w54RP3nw/uJMezyPCzPIavr/XDZX2/QRjZWcfmsP9WN6VkNVEZzyGc9mwDNP6zOyZf
	k/xOlo46kgs97zz1P1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSlX-00000003Lu4-3SNn;
	Mon, 26 Oct 2026 22:02:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSlV-00000003LtY-0USB
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 22:02:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIo60Z2591259
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=; b=Jgac6jl5zny6hx6F
	VxcULzScJn39Uqi4GE637+/ATcF7fRDsezoEkZRmlhlQMYL2YN7lS610IJVowTHD
	Rs/BkFidwqfrAnupV4B2MIm1lqjEPvMI1HsRIpApMOcEU2IkfYz138CHkS5Gz/Uq
	0P8GxbJkAhDvCYVrdOtKkhkLN3umkX+TbGir5ywpPaqJrO9hzhGI0BHJ4Mwa+Gmg
	2Dcz85r8VqK1oNswnumytf1DaIKB4EZ3IwOu3c49Ouez3QGCvGVMcqIColgVXX5I
	yvl6uQPVSOr48okL1i3i2oBPIcoJjNPFBJdY7MWuJMENd8pzLM74MtvxXEIBihoO
	zDuqgw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54gxtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 22:02:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so16850349eec.1
        for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 15:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793052120; x=1793656920; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=;
        b=Q2Ph5DsCJoKGYvkRP0r+P0AL8br+hFolYxJngWJw5skf6Qc5+Rg73xrQhbmjZGOK3G
         /6nC16jMeRbgk6HIXvpPQMKjf+p4jpcyNY9pNDBG5ATPXhqePnZIAZhpR64DaF1oH4N3
         3Y91wRRe8DfzNBxWoDM7NDItoazFX9ZytbChdofbcjAkMK4Z8rptUMrSUuNQNdrBwia7
         x/Cgga85Koj8ZD4uIIP7W7B4jIV28ecqE+e1jsCVGKW/mp204TAzBc7NWFJdpAaC6ahA
         NuNTraP4nxUvdxh11HRGzHhbe2p/9X2SOFdg5a0xHtaqc4jWqJ2wrsVCTf7zSApaFDiX
         VY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052120; x=1793656920;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b6x1IJStrlOrCI3vi0nsVyx9+73Wt6QBs6SXZvtKBhY=;
        b=maoTn9AKT5WQXRROV72qaTXpYfHs3KiBXyjvyJIh4bVd1HjFIrGcqdioLLag0jU97J
         Tv5jIXJoPUSitEI11yid0o6BL0BLm9nKwSf9p4LiZuKGFx3BPbWVR7l76qKNvJCpx/xZ
         5KqxmbQL3KXpAvczn667K3DP1Eb5Y6xrcdze8rXMBl3zKMY/kT3HuWMVS/nxc4kVTnqW
         ZYYS8V6npa2HZtpF/hrpswSOPAF3MRpJ3+KCFM7qgTJHiYu6NfDGkuOSh2NKYRxGi1fi
         EWTD96q/CSjAWu6d2aRGrTLRHop6fWdHOOjVxXJqqBLKbcNvLCqz6FzS257ruAMoOjfx
         dVDw==
X-Gm-Message-State: AFq9FYIj6VYCPbeeziv6f6uHEQp9hZL51vPllaiDYmBYInwZljW2PFyQ
	s6/hOPtpsRHX0MizMF/WC+oWXDy4gLEelnSEOS09WXAf/Nvt4A3dRgaEAHfzQrMgoEevC1wZXyx
	EN9lGQWjDUPvptV0FQuDvE7MassPEbmOSKerjBMk8sOa0C/fm6MhLoxxWLVm3ikC+
X-Gm-Gg: AYBFou3hewSzicV199Zk/pKsXZ8jEtypq2EfhzGn9KybzDQuAmBDR5PrSC4WbJFDxCu
	MZkd7O/OCvAZ7AUWFJtXk+kOkHfTM68g/kf3YN0kuuIOO5bAV7t0ObBhmX8szrTH1w6qhnkxdaF
	lye4alkqLmPGJcNE/1sqGG6u6sJWI0zCWBv1JmPAka/XPiJTBcWBEnjhvQyauM/pQ8KarWzepPf
	/l2H3xRWd1TPvtGsEYWR9Hx02OGkov+aLCUm3xWqoyZickireW9WrijzqfQSj0R8Z26OQXte7Hq
	neLGhmS2mV9WQLAsK5DEfzFy+nZppWkQRTtuOImu7SZ9F0PsIM6BemndInz4SXmBza6u4ilKUtg
	nmhJ/sfIBzHrTEdQv85StVW0iS1u+xk3rDyLKZCmCLG7qvEna4rQdvg==
X-Received: by 2002:a05:693c:638f:20b0:36a:eea:df88 with SMTP id 5a478bee46e88-36a0eeae085mr1359725eec.19.1793052119848;
        Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:20b0:36a:eea:df88 with SMTP id 5a478bee46e88-36a0eeae085mr1359691eec.19.1793052119045;
        Mon, 26 Oct 2026 15:01:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm8443486eec.6.2026.10.26.15.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:01:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
References: <20260915080053.918500-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix failure to create
 ath12k_dp_peer on MLO reconnect
Message-Id: <179305211811.3326479.14875064682698836541.b4-ty@b4>
Date: Mon, 26 Oct 2026 15:01:58 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfXwQKk8l0P5CYc
 mCNEZDuA5tx/ukeJshcr9TuUd+jp8ajeVQ8zh2s6r6w7R5TNVcSpXozDreMot1l7Gp4vqz9+PDM
 i9klTw62u/eU5tmSwN1guOp5sR6WEYE=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6adfcdd8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RqEOnMJ171x9OPMy2F4A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: uZmArqi6v99vJPVq_BAevAtAMg-laJ1b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NyBTYWx0ZWRfX+8jkPh+QDH6D
 300NDKR/oHzS/t5cX3ulxJ+CFkP74SOwg6HQ8gdm9XdCAlgb5McTj8kyBHQZ3ofcJpfJXGUxLT5
 my+z3vjARQifPNxy+zB7LoTdcwTWkJI0JhsE574rVa+6O50xGFBBhJwKBIWC6DwhD3YQfGUf5EB
 afN6u+ka37VFMrLRw20zvq38+G+8AuNp3j0ElqoW4jkT9ZkM7deVDnk0eb55ZFWR9+FvAoDBcN9
 6C63SpBhVl5aBV3hpU0/XRYVYva/Pg0LixevYP3u9jzemObWOohVgLd5mT3xVmuSV2Ihy+pdXv9
 DWeWlFPm70+JW7VqRxHvVXPBJFVvM2DuNP56AlsjZAxLOkso9rKf/s4fIHr5YGcjB7gUmLn7wak
 cvpoeviy/GOOqz1oHA1sgFWe5lCGEgaS0rEQzZMUYvd24WuYFsTLff9X3Ht42Opx6jUB2wsx0BP
 n8QUfSrzP/9Sljd9eEw==
X-Proofpoint-GUID: uZmArqi6v99vJPVq_BAevAtAMg-laJ1b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_150201_168268_0CCAAD95 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 15 Sep 2026 16:00:53 +0800, Miaoqing Pan wrote:
> In ath12k_mac_op_sta_state(), when transitioning an MLO station from
> IEEE80211_STA_NOTEXIST to IEEE80211_STA_NONE, after ath12k_dp_peer_create()
> succeeds, on is_sta_assoc_link verification failure, it takes the
> 'goto exit' path instead of 'goto peer_delete', leaving a stale dp_peer on
> the dp_peers_list.
> 
> On the next connection attempt, ath12k_dp_peer_create() finds the stale
> entry and returns -EEXIST (-17):
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Fix failure to create ath12k_dp_peer on MLO reconnect
      commit: 8b6b871332b5078342b3f809d35da7e68f6f9c9a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


