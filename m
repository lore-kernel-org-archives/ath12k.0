Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C17A606A325
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6SC/D4B;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WtvTLuj7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i0Xkd6cP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MGfJahl6opy5UHgR6FXNXsdklT3ypJIX0onMXzV49Xs=; b=a6SC/D4BnpFAbY
	NJ0SnHsxIYh4WcSxPKFoc/EGlxehb4zYDkN9gt5TNEP4ne5Dnw8aCbs9nQ4RvYcJOw1cxwsi5R/To
	WK/6fz+VDvkjmf/qxswUCRnEfPaVGlOIbLfDCevf4E+Yv3KFmzPb+J3haxoODUx0F2bsfG3blT8lq
	+0OnzAidqAwE6Jb+K4/EdqQic5c/Op0ahLSs3XUy+/4giZqUmgrvKd4aY9yNHpt6zu5OXRqwHcnWB
	DyS/KXcB0n2Pa9nQZkSBEX462IKl+cvmgjnXZdF9mc+VcqF9pB1T9fG05dCG7yWZ5QxG/HckKg4qC
	zkTX9/n6Sv3hfV0FquMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0x-00000009eZ4-3VmN;
	Wed, 18 Nov 2026 17:00:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0t-00000009eVX-3lkX
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwFiK4043668
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGfJahl6opy5UHgR6FXNXsdklT3ypJIX0onMXzV49Xs=; b=WtvTLuj78Y8UlmnL
	gWYJld6tcW/px/Db2s6/pmkl5XBLG2VCNd5Y0E3BE36vPPkpPiC0z/t+gVe1RavT
	glUxS6PLPfmvA4rPAXGvhWrl70nCIkBQ7VSELnZ2oNMokSz5pe2iVlFDP0bxBr8A
	Jsvmp7XpKEqRmI7yc508XhJmfcJeatkQpXJGeEPMqYY3/eKAGQRdT8ULZGUy5Dw9
	jm8uNAqT+sN+g6+EltXQGVtIcSolrU/17QhDOUpVmW8YZ6Grya5T9hljMkA0NLww
	58POrH6TDa8xxpkySfn6G0/5xFcjwshco7j9UMhJgE2iptwH/1BIr+5mWGW2+Z1G
	FWuCsQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcrvwe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:01 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3837afac185so1229835eec.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021196; x=1795625996; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGfJahl6opy5UHgR6FXNXsdklT3ypJIX0onMXzV49Xs=;
        b=i0Xkd6cPkNRzk92Oy4X7WzdjqqCGuJEDHof8Ke7XlItRB06bYpN5ZxyOWunjawP11H
         M3obrtdEsb7jgSU/7uMiPOGMSHLEnc3l1uGKnivPTz2GJbR929++CdRU7JrcqmZfII1i
         vg6tYNanp4XmvdZq4abVs/kHavcgFKnc8pUZo8q8zBiqLUGa38y8RuJ6zZnTjW/+/SfT
         f+ARKL7QOi+1dA2Ccsjzi/CHziPyFLh9Abr47kpDQt9+WrrQMn1373ai+10edlBiyaOD
         OF8OShOYa2quqMszwv3y+p0Vawdcd+g3LA4VGLOKinLf6Q30x4X0rWkjq68g2vyvZKtB
         40Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021196; x=1795625996;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGfJahl6opy5UHgR6FXNXsdklT3ypJIX0onMXzV49Xs=;
        b=19ZAtpMZNwWnUwFyw+ka82lyeZ3sQqYk9caL+06I3USdSfEZ0+1nzU8AiJ28hE6kAQ
         v/OvGnlWcja2a/u7MF1AFvNS+9qV4aDOe4pO+Z8V48XyWfz+eq2SEV5t5MXtJ60przJv
         g97L9QICgIo8/b9ehUEBPpqD7ymuCP5E+yJ1ZmXYRzkZMkKB5+moosW5Yz+j9HIsgHR0
         hiTmM6KFgQXCvVjlQKSLt8xH1xp+GqKIjLdIyABUa4vyWB9n/AxmShBOKq0PZhP2r+Rq
         Vi72ktEYssOsOU4KFl4yQNCw7iKMhYi9nthWjszwrVM/WQn0rccZtT1p503NaNoWG9ZL
         f4aw==
X-Gm-Message-State: APuU4Z9CVlVn25/6GuaIgtyavVqdyTcUKPrZusmFsKzHLsXftPZh3pVt
	HbLRXIZ1M6W7wUbnY/euXWLlql0OIqOSKDBodolhQgqXUXlIYCOEI8PmQV4cnS09ugBLVnwpjAz
	PMRpLwjHyiMmFMXLZOPNws26wbmlgksSUMsPgb4XCxx/DCbWgwm2gJl2z0jkVM9Gjdw9tNnHo
X-Gm-Gg: AYBFou2PzunB3Hnm7FaC+KWMqQ2OJ1r3go1IDQpS7emRThXmAu/5fUXqxYguhtpS5rS
	n9ricX7qmzFlGuKr4ryToYDjo05eRdG9cLAiXmpYLR72j359fCuJKaptQtFgmLBwUpRq5pioQo0
	el+pdNNnCI+a00q9isCMVQOEEXcQUW1U5g4L04wA/3gDcrryg9GGoVab3y5RMnFbLobfrADHX+h
	KzUr8DO6OZdu8zW/OEWb7SH4qZR6bO/qQy3rWcIJhK0RIHeMW8ub8dGgzr2WCMRrRQTOrGWAL8N
	w4tiymXgTkSSg6roWpUZm/N2iyXSo1G7gsZjNWyyQps97oZWniC9wTPDYSM6ofuZtR/SxH2hmxt
	hFcktXmBGgAZPgmnXp0yi8Jhhd866RLnertdhOu+uZWXrnYf0eoFWsyVXTx6om5D+jJbP89o5OH
	Pu+1FXNxa6wrEnprvpj+zYAO39SmmW
X-Received: by 2002:a05:701b:4583:20b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b543c26eddmr2929808c88.32.1795021195598;
        Wed, 18 Nov 2026 08:59:55 -0800 (PST)
X-Received: by 2002:a05:701b:4583:20b0:1b5:3b6e:e1ed with SMTP id a92af1059eb24-1b543c26eddmr2929773c88.32.1795021194861;
        Wed, 18 Nov 2026 08:59:54 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:54 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Harshitha Prem <harshitha.prem@oss.qualcomm.com>
In-Reply-To: <20261118050017.2334721-1-harshitha.prem@oss.qualcomm.com>
References: <20261118050017.2334721-1-harshitha.prem@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entry for Harshitha Prem
Message-Id: <179502119418.3425953.15218290931857402896.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:54 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: _yqp094TW-lbRs2WsnWvOIa44ZxNJKzz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX/a87P50bdcom
 Ul4crD7ayRzyCAQxdH0+qblg01npg+jXppw1ZAwtz0FY3wtqV6W/RuZiu8MqGafndBdhU/kdtA6
 dNqtqIbLsVZu401JQ9zMw5iiBAA/Anc=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdd991 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=kXMw7DDU_dyHjp_hPhkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: _yqp094TW-lbRs2WsnWvOIa44ZxNJKzz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX6gNm6/vi+zSh
 FzAZEa8DKJQBqYnojU95RumwRBKePhKthuE2H97DTpBzVGGAdUPg7w9QxNnQuY7yPGAMkfyI+p1
 ApBK/vXDSBzhWsMSadTC1Opdv+SZwqj8itty3+jNgm3jbsXRj6jUF9oaRP1PrA8TqIA8mcp8vT+
 HSNeTIRpBfBO2WMAG27N9WMlEY54xlMyrl+tLhjFVzsuUeO/o8tgCkePtY3IIydV3wYkTpiWZUc
 WkIXRizza+qGBZA6n7YLAa6+W4vAlDegjZuYWY7PKoI1QA9ir7kGfV5Eh+WxUeI6t6w+BVcVXXb
 ZDA6MQR2fFYyW0W+OGRKojPNmvdY2Ud2NyqffWfdITWu8dg38zx2BP7+bOuIUpLOWeJBZ9ZUw5z
 imwUUtKVrlqZ8xIHgHS8frymti5UwIJNW3xGyo/fW+xVge1FCL7FPIINl34YlGjeDbnj33heOjN
 euZSkdEm9FCTwBayUaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090004_115349_3937B438 
X-CRM114-Status: UNSURE (   6.21  )
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


On Wed, 18 Nov 2026 10:30:17 +0530, Harshitha Prem wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entry for Harshitha Prem
      commit: dc9bb276b40fa4026fb7028460b8a90738b46ee5

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


