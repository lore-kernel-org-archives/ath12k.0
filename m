Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E954606A31C
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 16:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LbHqhDJF;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=hgnUhU9H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=; b=LbHqhDJFWe4PsloXoiND8m5gNC
	ydxeNP9h4M99KIraWvTWv+2Do7WZOr5FF7/hN4/rqcOklBxAa/sHUzkoPLGfohUfRTXQPBebr7+pE
	ZbXfQbYo80KolInrOUMz68ksu686IhcQOgEkuThFMPlQ4Jmf2QUlEBDx5tDC2anxUXbE59BoyHWfz
	Pc9jxi+DN3v8hnzkPxpXOeOE1hzyKg17PPVnBUg+Z9lYzszvJLl8VUTCUmEVL5nCcYri44+E5FA3h
	eY9AoWKNON33mShkRWhBl42DGAZNn7COYrSUdCTMSImheGMKkUqJoRJoQ4inTmHlWuuad2l2DEclg
	OVnyF6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCbL-0000000A9Rc-2y1F;
	Tue, 20 Oct 2026 16:22:11 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCbJ-0000000A9Ps-1Pll
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 16:22:10 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8b0e21048f8so27238457b3.0
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 09:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513328; cv=none;
        d=google.com; s=arc-20260327;
        b=Uv34wUUr6+Pzv/029t48almHNa1sIYqU0SvCfkOsePeKqHPT/Ayl7uF8MGj6X9XcDG
         vy83neiN5HS6gIjHbVj2zoQBbMlYGIplfBZDcFVJi8iAWeqlB11FxPOI9rdJWkGHBVnv
         06CjyHdNqq6gUcHaA8Noxc0FydNqmtDyf4+fTLDis/Q2AoRZrpXWcq0gE8gJ3W016TEg
         BiFvu9NiNmKnb94oVuUQCxl7Y5+aCQlvxhRGgSWw33Uz43mEIAiQoZ0J1xlW/Q33G8os
         lLEdJDE92ACkmNBqxkO/PyQ0485HLVzv2IqRjpYsyoQ+MRCg6XxNA6efGLcxmczGZCvy
         pjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        fh=UZaKYbKTkiy3H91IL/Q52uNatH/yPpEE+tHI8UiYEAU=;
        b=MIGP7zGFyudM7NzSkTqp7MORfVr77gNS1fZ7EBEbUow2f+WNgxHSY3lWfS9tnLa5+X
         HR8k+9uy7a2PI4I7hw4G2tR2lAgOfS8r4RGV/YXtwdUnAeVMep8+lCzrEKyVHszIKIUN
         ijLcRuBLRS4K/Vh0GZ6sPgB+Z29/IfroXb53g3SmJtlpr7VEpHOFCoPMjvqjI/5wOun/
         yRMZXYhFIpQukXthjtKEKcLNrPh5gba/pnShc0yeNi0oDufh5TZVc/vlnoHYJyqz71lF
         25YGNnJz/d51R7+t7ltIQ/ztO911JBnEx7u8gFxB7vLruDU+qyqevjKm95Z9icZYGuez
         GzXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792513328; x=1793118128; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=hgnUhU9HEBeMXm+Jtzx6ObruafaDhgc/IkkEBnku60VGFHxfaS1/OLHajQ7wYP7hjW
         faVx3/Rs3oNBhqnur8YLLBP2FDOG3hD0ACxcviviI4TNhRVOFgS7MJdSk9ep6hpr0zFc
         b6Vic2Xbx07vACWsTsEqc0nkSFRK2BPLSNAFeUx2icEV/dNrffhG210/+4GH12AUaYGV
         EnNN/G5fEzP0ONlHu3CZWeEu5p8NJFtMhuOHLVM8TDcNxSIZYa5QmnA90uw1EM7dcMZH
         AqeQLlpnx5F1MQBIKFycpmvZDhA2XBTYys/VDDP9rk4GLFS5iVnxVrs++g1cMBvUMr3l
         6Q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513328; x=1793118128;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=XpnW8lhe2Tit+ZREtJBY7ur+7SpldCYze8gKYsZQ9MdcgGk6uhxgCe8QVsbWJ9ofdt
         BtcMPXdPCTo1+29mQ5xTEup4ZHVJtdYaoQgYorF4Zs3iGbba4ZDZJzF5yWSfmHjE371J
         r0+LwoeqU9L/MGkvOd07jyzklDC/VHY0VT1rNF8gbf5QwNl8iSYEmrg/3kMfSGQ050tc
         DpZnR+jZ4ZmUelZtOpN2Py9T/ejpFFKFKoP5sYN3DJfpMsN1c5RjjEfjauTSx1vLWTQO
         SKx0XSbdWiHQvfnBTTAc6PQ7fEL4dN3MZ7gkWGO1RNFWeRQZREqTtIhvrRtb8fakTkut
         6G1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTjL1PWC6kzBm358AC6fcLzGmuKMiOUWrMzRtkLyjBmP0Abd4paZyr17JxpaLOu/8FIhNmdc8=@lists.infradead.org
X-Gm-Message-State: AFq9FYKgT1oWKRajhcIdMQvC2QiksOOsh6ITuh7MVnTIv+1N0/6bOvcN
	X5+H5GttAL6cJoFTQ0R4zC/0ihSfSFSsGMchUe1q0pk9lx5YIp2sVfbOkIdTqU2MIRM1pbF7mYb
	mVR6SuiO+AqJSojcl4b4gSxYRPoBlTrc7DDxb6wYH
X-Gm-Gg: AYBFou0Q4Gaw2sTqW2kWindo8GFGakX/C5pfz7uoqg7FNR+wiuq74n1jswcdyVG+Ahv
	qyCjoqgRRZWtmKroEoOmR4HdJCb5kuSC7N0FYUyUmyFDkGeMzUzvUNXG3xNiE58FQ/fwQq+RpWm
	pQ++fwXBwd6reMpmRB1+8SPOidpwtQ/25OHw070hZvsW2aLvyxXwacgXvb2FatXYSmtQI/BHmr9
	MgGrsAQ3PnX96pqtZ51yVrccqKLhsh6ncJ+ARx2yL8DkkzxEphuFrGM2eQK+/8Q3U8lqo903URX
	aOpErP2BFsmIO761zeTONA1k3mwVpZXdit02eEPrY+0BVTd9KyYNl2ofC1kMPvI7+ER7omgXqDK
	IyqUrdXUz4LgKnXwWt+BuLkdDC4U5DWWr744T478nbg1m/k0SsvNbazq0B83oWhLX9Qw1UCwRm2
	m21LaNa4n1RETFTdQL2QIJ2B1WD/26vob7NdffdEzTG1mzI4egBa8ebzr5ydeI4Mm5b9fJb3nWB
	t/XEPK4PPJgRuHsFne8Fo7DEcSpFPPwowhw9vpZ0nHUOO06g5IpBowBLA==
X-Received: by 2002:a05:690c:298:b0:8b0:cfe6:29c5 with SMTP id
 00721157ae682-8b0f2189609mr42132047b3.37.1792513323232; Tue, 20 Oct 2026
 09:22:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018131930.1116724-1-julius@bairaktaris.de> <20261020160831.2133912-1-jtornosm@redhat.com>
In-Reply-To: <20261020160831.2133912-1-jtornosm@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 20 Oct 2026 16:21:27 +0000
X-Gm-Features: AclHuK-kc3kyc5GKqkjHU7MJ9W5xa_vMhwo9wWG2suT1Jp0haBr3CNyjEmQ0QHc
Message-ID: <CAC1t37JurQdWm7+kvBRuAafTY88DudtmG_Y=oLp1zk6FKxSkBQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	baochen.qiang@oss.qualcomm.com, hujy652@gmail.com, 
	jeff.johnson@oss.qualcomm.com, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_092209_372803_B8098D13 
X-CRM114-Status: UNSURE (   3.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

Sounds good. Looking forward to it.

Julius

