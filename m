Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6D606A319
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 03:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M+w97rCz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=qiUizUff;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HGR+K0Y6;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AJsnGc08
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=; b=M+w97rCzHSkXVPl0YbuMEXCCR7
	DNui6lO+ZFhUQxP1YkqF4UdVOH1GMzCOUTUeW6rHWqJDCr4nIWMTYCJwM38iTf2z3uK8lQWBb3DUE
	K2vytf6bYaaX3YIOCP68auNKl03Y1HW1y4LeLoeG+DcAjn39UjQQeCfM75r6HnO5JDgbpa54E43Me
	MVvoHAUwRFn5evPeUaCQ/srY+loZZSS+26gGiKTgMwS5chQKSL2cdYhutQMjtUnsxyCCdA1eN4N/0
	Zj+9ruFU5fiy6YT9OV7y2dBJCKITbG9OIL3MShlSYxCC60BEBZYR9UxKqZPRMzGHDHVoFohVx4C5h
	riOSPhKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Cx-0000000FRKp-37gl;
	Fri, 23 Oct 2026 03:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Cv-0000000FRKK-36eN
	for ath12k@bombadil.infradead.org;
	Fri, 23 Oct 2026 03:44:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=; b=qiUizUffMXOh3JY0cBV8mT/Ued
	cDTAea5yIsE1kh700k+ytP01BBrHVc10tYB+kQh6aqT4RUxEoQB1RGspYUzJ21tx7eX8lV+i1NM0k
	4J1kWuBqHd1Cg6ja/Dy0V2So9PqrUME3dOKrgSE4daPk+QExieP+TrmW7nc3x9U9DRBY+Xjj2hmb2
	RCVrKQbZr/li9yEsMCMMIpk73qW2eImYG7U0yvfpcGUVkW9DoYxzWEy0UfuYv4Y5FqGm6F6X+XiwS
	wNx6n4ih81AbVoSAYC08Mtz3EJ7A3nSXr35T051smpncx1/sVJu2RZh1RpsWv/NiapiAeTnCwtiB9
	Rg3PrlVw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK6Cs-00000008fOf-18hX
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 03:44:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FGoY1792788
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 03:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rDVviVjGMtt9TG+XFk050wcc
	C2aDhnzCOMB4PFkLb+o=; b=HGR+K0Y6hv3tjU6JGy4GJhJ8z6ziq+8BQ4wCfSCn
	HmBc4nsKBrcYy2JHafV2oyTldGFfivc507qHTGq68kw5pIK+/pl1b1IPb4o8aYAo
	NvpCb++xRkwLgbxlXdJT7+sLLMpGAV7gDrhs8GFY0cmX6lbwlp3GqsdX9BDS7UYT
	Ih7dsrR6GiXgzBAKpZfb95YDy/Xnn7ZO7J23gUnA/KhjYpKy6jtN/Zp3wM/1fzMM
	59+yLsOR5Q1VnH100zc7UvVg9lFuSUjCIIRExcpDxqMcGtzhMt3o2Oz8pIJvlvL6
	gXsXRxpPxPKc0R+QTndiT2RIWSDv8L+Fu7KbOapxIXtn1Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0j9bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 03:44:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so634817eec.0
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792727072; x=1793331872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=;
        b=AJsnGc08KGgDbVkQDF6s8y2lnBahhJBOEeQJmmQcIBu1mSaS4Ki5KWLtZpOAfbqYh9
         ediI2eowkyuPs/1dl556BWVIEj3wRVJKBzIrCnexbW8cw604jx5iLwa7sthnT+P1YEfN
         xA9pp20EuEtoCspWUEdtJq6VId65AdCAqigqcgsQUSFS7sY3P5PGFm2x6ZwxyEnHrNO0
         dHK/Jamr7YBJijfgBOFfwHMhchFnmNppQRor67R2eRmyGqYqXsCLHCBuqo1XNOHzYXxo
         P38nuRIm0WN7ixmbtt1VuEJvW+q0Z6/79Ppi16wQpyn36vVwkxpMpOtl5/yOr5t8WzlF
         c/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792727072; x=1793331872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=;
        b=CAbn+hk4k/FcB4N93LoDa9cs69bOa5pUAk6/b2ndYCJbuDjcvR8aZ1wwDsKUTGxu96
         BdVrHcL1wNuH1IWZH/AJ76I6eDGeYLxmElRpzvU3AvmxsRsMrBtYKD1IqqsC+/PnPh3S
         nm/qKGnXFGacL8fU+dhSwtBG+jN28lRYKuNmPY/39PesmlnUu/TT+SJkZYdQgEfvj7iQ
         sQ76vFfULC7GFLmZnAn2GqnP9aS8fYk0hnfmT4VtTJHCb70AfyHn0pgp7IBeJz6SkgeP
         2P0xMwGdc8lXb9g21VfYIsYF74dbyYseJCgQh3BfjR+0uaECZPji1/NeB7HnhAfIDjeA
         K2Aw==
X-Forwarded-Encrypted: i=1; AKwUvByFUHGUtJOdZCUJ5V7VcCri2nEyc2gKhaaICl2IUuz26I6efDvgWGgpMZWOMPx+4fCAUf5Txzk=@lists.infradead.org
X-Gm-Message-State: AFq9FYIC3zkL3LQG9IO1EKHp+vNDaYg6R9U4QX5Qxq72hTvnZu1qayAy
	MQfBC70kj/QzJjkccAsQ6fwSpjy8A3SblO7PkjwzgNFs3njnObdnSSTHtTTtq47CyakW0FU6oyK
	SWbt/pu5muLL4SEl88mU/hVqiazqwjwgZIQLonFwfiWQgQ561zHS5oY39J4AJixyO
X-Gm-Gg: AYBFou2aJuNaqgReiVD26mcw2QhKpKr3mlqX1Ez9pABL6fgF+Tp/yVUKZ1ELi8VZ9g3
	DHW7DMq2+6PwMDol2swCuQksxrSWFjUSnMjxAI94/4dzZ4VRVL5uEQLYH68onWKki59o5zg93Q+
	CbE/CsPIhF2Fyc2Roc1n/Ej4ePEsLCO0mTJxLeGqe+2ahIdpLULNOGxpOcGKLa219div1nuam3D
	+gVBoeXcBdnM2ngXSXXgSm2QSIr1KptvCgWLBOtE7P9kWLpG2CTh2nxPnPfJu5l3EwD5JmbqLbR
	mZJBUatVBCoOUmgRdqj2HvdOq/vGvESNSgec+U6zkzF+8XqV3lWsZ1OPoMUOKTnQsrZTv7SyTHS
	sUp8wlbhV6237Ut2vdMTbXHk5x46WW34MRgL7CugyaQ==
X-Received: by 2002:a05:693c:8804:20b0:353:7d17:9a86 with SMTP id 5a478bee46e88-369d9872726mr1282487eec.26.1792727071881;
        Thu, 22 Oct 2026 20:44:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8804:20b0:353:7d17:9a86 with SMTP id 5a478bee46e88-369d9872726mr1282459eec.26.1792727071304;
        Thu, 22 Oct 2026 20:44:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10b5fsm2708799eec.27.2026.10.22.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:44:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:44:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: JqkkfmLC91AQXbXEtjSaj4lbKngjqFFT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxNCBTYWx0ZWRfX4vvtIyU9ytPH
 6DEGrQy747evy7/XZPebs6ipKMbxKwbcP8QdofOWIxo9nPwN+zrD7OMPNomPCuDWfqHLizVMGdl
 0XDJD40FOkoy308s1epd5wrZ9iLvEEtVrivlLnzLcYieXd5Tj+YSFWlEx541bOEXHNZr0Q/ZH/S
 uxdbUId2uWdna0Hga9tD2UZ7U2JPkxhpr3brKvbECWFDGJY20KR6HIlUbQE9vL5qVCAfN/r5v2d
 3WKhBF0+XX2YkIqqFl3ufoHEnM+sJAZTdZm7X1Sw6yB2IxNfm6T58vTLMgGHAtR3n30pQf2zejh
 i+F5PNRjyqO4Je4nBtBLCv75DsZe4EOrWjactYv+hlOeAhCITcrskSpNZNS2z2COTfhVaV8dU43
 9vrS+BgHwLMa5/hfiOv6ES6Tn2wGMm/j9Wl7+Z2J/ORMmgyW5iTcmfX6NM2hoUQA2h731tvjJwE
 7OLhgIZricDddKhSW5g==
X-Proofpoint-GUID: JqkkfmLC91AQXbXEtjSaj4lbKngjqFFT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxNCBTYWx0ZWRfX9F20pf0UqBZh
 AnI2s9XREbfVjufI/6+7gMjI6+48C1+shH1LOvrg07OMqKDGMkqTmTtTEohobft7BRgpaeH00cy
 C6DLpaLR8wnBzEPp7GOVSSzp09Zuq7U=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adad821 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_044439_014311_99E33518 
X-CRM114-Status: GOOD (  21.33  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

+ Jeff

On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
> 
> 
> On 10/23/2026 10:43 AM, Shawn Guo wrote:
> > On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> >> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> > 
> > [...]
> > 
> >>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> >>> the ath tag (working). It lands on:
> >>>
> >>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> >>>
> >>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> >>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> >>> and works.
> >>
> >> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> > 
> > Thanks for confirming!
> > 
> >> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> >> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> >> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> >> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> >>
> >> maybe I should submit a patch mandate this rule.
> > 
> > I'm more concerned about how we would fix the regression for 7.3.x stable
> > kernel.
> 
> we can try to ask stable team to backport 15f7603b69a8 ?

Ok, I can do the backport after the commit lands mainline, assuming it's
part of Jeff's PR for 7.4 merge window.

Shawn

