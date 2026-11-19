Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97066606A325
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 23:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cpowEMHD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZTnKvAW+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gyxfJXja
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=cpowEMHDDdtQt4
	FZhO9DSjBPkSwMtyOdlg/7T8oLxL1kju6Z9QLFFHRsfidCqqyCGgU25220z3bjP1wZPaXezr50sfK
	ImoDMfrPv5G+Q/1A/4ZAYMrPPfTxtPsoJ0L9TnHDpybK3sBDhG2tYXv//tKVMtrMNhpCvaoLjSQl4
	T0MqegZAlq61OYE04epuSdFJNSDwzYXcNeac3+it9hJ6cwnDOMEwVHuyGpkgY0uXsaa5lKPgmACyS
	kQpQTBSG6fCwaXLOkIsDiZhI5fjmV+owfIyw9pMVzAMQGdAnU3KwUV8ffCYNYhEj6E4cDF3cf4kqa
	WjumoLhG/dWTZhJLfMuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBvi-0000000DgZh-1tU1;
	Thu, 19 Nov 2026 23:52:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUBvf-0000000DgZM-3V41
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 23:52:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJJ1MB63655820
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 23:52:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ywdLYv7XjTS
	09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=; b=ZTnKvAW+zAiAMcdhUxE9mL6AgME
	bxxquOgyeK4YFIzCo/fLR2rpTzpnbYJXwEx3wcyPeD3B76Lev9BRw9f/7xwr49pw
	H4NI3StjZOSUUvu/9/+eLBUULAtxgyM3ddCjR88jNAaNiRNK2fB12fL0Hoz/Ubyb
	st54ls157qLuE8NNG4Qgz/V6tUoFEL4KlKP6GJMM0rCJs55f11ywbS6mJGt/Adw5
	0lQHYe0Nx04sWtg9eqCReX/vNvUDyIG1+TiARlSO5bozoUjEF3yzDxfKXA2Xnu+h
	EmAMgK+2lMd+quWkHRp1E2eV9u2ew41J1WexgFPe4+KDSNToM5yoQwtOB8A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gubcyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 23:52:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so387187eec.1
        for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 15:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795132353; x=1795737153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
        b=gyxfJXjak/9/8dGkiyJE3mtGww74zKCn9oTYJwV59D0KF6FRXHJcGs8X8mMk30ABNv
         kr7MGzl+HSCkNrmWgh5P8KIMtzJuNykzrrXtGBe0KeKwG7yE1RW3s/Prww5XWEptu7G6
         rx6fp4TYQ4YiXgKtzY/10+3esgM8GfM16k9gLI6XagLozbC6xKB5lyavFnaOiRZVYIfa
         x4WkbxQbRRtDNGoT4qkytzWAN+VcvmBk/crxNrXzs7+DQpFqVHv11zQkA2RaD3Ngfwez
         oadNqeiqVYmkVIpSBbcUwHOvPTxw6w8AxlxhYSAD7qjI2bk7iVtSJheAmP8PrkWCBQhZ
         FWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795132353; x=1795737153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ywdLYv7XjTS09LFKQvuVk3pTXGox0hEDPrVdY2rJ4es=;
        b=m6VvNwiVES7Jl01qUdOmZIER3KgWJXL9DKETwoomV57KvVTIR4a3OpdCvEGwSHUNLh
         uEHTTZ5sAX3VHPcc5PsXAZu3hkZn5EL2kqHso40ej7yGg4bNSu0vtrQLpZtReULqgihX
         h+dnnAHCKjiXkKcQawUnbTk6GSUhhwJDPwCUPLQBtMAQcIB18uwHg6FT7PyXIAwcZNp/
         a/UQRFVWbxZVLmEXbrTC94QZFWYSE85BYUGOxIcxkpQ8sDrFdtsA57DJus/uO7L41YnE
         LdpBZ8BX8QCjCmn4OXJ/68QvY0xhePp+MlP0iio9hMiU1g/3DrTDuHqL98reCgvmzGYx
         JFmw==
X-Gm-Message-State: APuU4Z+KOHu4EfOsuZGZV0UFxu/vmoXjdQjwleEXcPD8mKCtkwc4wpvE
	o2ikZifp/8LhDrs3aiiR6MVSZOb2Hh1iCg5tEOh/x1zdDatH+eCpdCV4YvxgFaDLiOfUBSm1b35
	4CT35i/jDVeUZLTqLTIPr52OhnF+Fl4Ev6PLQQ+zDy4pwnWClS4vUT/TEWXvzpAoe
X-Gm-Gg: AZFdTZfdXW/MgMxweMCQbt3nESD/Y0FWPtb6wVuKQWPTxR/EZv+5aSqa2AIRQm1m2Ak
	uOYiNTzHgpVETgRSZRAlVgkwcCD77HjOvYZyH3fBAIsbA/dpuZEfKj2CT6VAv33fu/ZJ4e2AW1X
	vujyAhXQQju9cFuQjeV2tbYNQ323a8KwxqK1puf+RhWahSVnqHoOSpXfiOG6OV/FUU6Jk/Y7D+L
	OwdRhywYc9Xjb522Lwi5QZS4A8byh7gkzlqnzimhwFWbjPTzF6VJ+nLDwl1VszRG71KJu7afema
	jhSUdyHcKja8xszwaAJShgPXFCrqd59z2q5rEcFDyNdM+tdMqbdDvz2D/BKsOBPYctVjrCk7Dcn
	5sRDzsMJkSHiZNeoquYdu2m0s9VYcHk/rvZLDfzc8WkkHsVTjknfUKPKeWRLhQKAVgfd1RjjuSo
	svsggrh7QMdjTt1Iq63aNqh1Brv1w=
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1067899eec.21.1795132353233;
        Thu, 19 Nov 2026 15:52:33 -0800 (PST)
X-Received: by 2002:a05:7300:e9c5:20b0:381:f33d:ed9d with SMTP id 5a478bee46e88-3856fb6a214mr1067876eec.21.1795132352543;
        Thu, 19 Nov 2026 15:52:32 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm2032315eec.0.2026.11.19.15.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 15:52:31 -0800 (PST)
From: jeff.johnson@oss.qualcomm.com
To: mantas@8devices.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com
Subject: Re: [ath-next] wifi: ath12k: limit WMI_SCAN_CHAN_LIST_CMDID argument size
Date: Thu, 19 Nov 2026 15:52:30 -0800
Message-ID: <email-14010032-20261119@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250310-limit-wmi-chanlist-v1-1-8f0fb45459a7@8devices.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA5NiBTYWx0ZWRfXxGa1E4PpMJl9
 orTFPj9sCr3H/wst526pPgqy8esygbb6HTnlr0vQrdbm57YM8LV3jSXBczJc6C7BtfyKFsldoDT
 0q1YQ4XgAK1u5ZCyD6fhWWlIZBZkN5E=
X-Proofpoint-ORIG-GUID: oj-vASwVNAzzqLhDY-MEIkAqfVsp4DGy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA5NiBTYWx0ZWRfXzhcDH01R5Xvm
 4rXc+r3SdJ526piM4E/FuF1AEm5jJuPBV0KZZ2oxb0HQVW++dd2tQPl/syOflUL8jfB5gmv4GgM
 Fbv3J7bUaI2w8+ohh8JZxFuZvfs2N7uAYzAfYRlQq66PXBWZ12eRPn7TJ+M3SRW97bIdBNYuhxg
 MoV5CwhCrxgS0mLXkGKfpe119j2N+2OaGY7eQkAARjON+4ySGnaxz+dstIK+iBGywSiXaLs/VGe
 OpKtnYwts9ZOPFjacIi5LyPJoA8BCmjbzlU1T5OdgnAyYthxEeVLNyjfGjlEvY0JSSRHqu1WH7B
 8Y1l3Fd73DnQ46LrIkAB4/NLy0q3CiltjsNgRK6Me8OUULiNs4GJNE3jMjaSnn+FOb77+Fuzz1Q
 GP9/YXoTsUvy+kO3cPrvb7r8F66gkScfu7CYG7WdRn7gphLc3Sh2GZjqJ5AxXl6HJFBbgaFxqex
 aTdQM2fJRqNw8et7qGg==
X-Proofpoint-GUID: oj-vASwVNAzzqLhDY-MEIkAqfVsp4DGy
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6aff8bc2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=u5w7P5qLusBq6V5lPPMA:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155236_019513_79DEE623 
X-CRM114-Status: UNSURE (   7.79  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an automated message.

I am cleaning up my patchwork backlog, and this ancient patch does not
apply on top of the current main branch of ath.git. If you still wish for
this to be considered, please submit a new version of the patch, rebased on
the current main branch.

/jeff

