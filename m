Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1C6606A325
	for <ath12k@archiver.kernel.org>; Tue, 27 Oct 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SlxgDJYk;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lxoegA94;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tz6R5yn6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7BHSeB2tXvPZMKBn/DL1YApAlb2JGYfD53s6iM61Yxs=; b=SlxgDJYkC2LHqI
	wdAdD8QpZm1un2J4UrB/x9gT6huxg0qMnQNyRFUa/xLzVFcRhUL4StUJ6o4mhTpVE/uhMynJo3MOC
	6B0v0T9Y2yDrFGXAFL/0hh/lzB6M5FJpBZphStZ//xt7A/Q9jn8z3idCO5+Pie8Vleko5NQXRaw84
	dhbHstHk/G2iAVd66T55VyvDKd64uMRAEcHJBN7l72ESFfPf9pgBc6UeiOMh9lN0H31tsjYuOKWeO
	XVHYevY5KbTnntlA5XqQqlwzPkkco7gl30uOJngCSBU10tiExFS4tGK9AX/Saf+VBVPu079iDWlWe
	keoSN/sCbBEjMqurh/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJO-00000005bWr-3V7O;
	Tue, 27 Oct 2026 18:54:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLmJL-00000005bVI-3tKQ
	for ath12k@lists.infradead.org;
	Tue, 27 Oct 2026 18:54:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RIHP4x3553884
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7BHSeB2tXvPZMKBn/DL1YApAlb2JGYfD53s6iM61Yxs=; b=lxoegA94XWTfia0O
	UnlSUY0TgVTpCHqa/buUmnkOlrNq4mUC7Mks8AtdhOiiRAQNVwqosKs/gBUN8UvZ
	p+KFp6aiDMyYZi9hSCbBy3SlDDqF34btygJRR5QQLiA7c+prdHWMoprMapk7bN/y
	tcAbtIpujMq9ubhwPyInIt6inCvvIDA0ngo9i/9B8nZy1Q8HHy4rk0KOQjiBeG4m
	RvzOH0inVsBieg+h2aQE4zrgtszwwtfqnKixYM/s1CfvT1/EwcCSsqO/TT6CdZFi
	RueyrsSzrHPeaEg/LEPWT8XCGFUKkgFaCN6oPnChGLXM7aiIp4Xtcy8+aj8jTOpC
	txMVCg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw22sq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 18:54:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so178856eec.0
        for <ath12k@lists.infradead.org>; Tue, 27 Oct 2026 11:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793127254; x=1793732054; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BHSeB2tXvPZMKBn/DL1YApAlb2JGYfD53s6iM61Yxs=;
        b=Tz6R5yn69iAlReex44F37ECFJbApG+THpLYxqpq+Cs/Fksc6uz27pZtSDZcZfpm/pA
         CyGFqL1G7N8pTeAsfWX4np9yx8zvoVaUnSRYPyPSL4qGIp/Yil4FBB8VJQYeiurpICVK
         zW34qJnIOzoPN83LY8D1A5H6DjHObvFG8IELlTOnSFy2QVO0LJa8o/w0FDnGPPXm+Cv/
         e39LxhZajBgbOlP0MLEPyfeIAoA0hM3i2/hk2MHerHPAuut8Ba6vLA35Xk3xYLzhUKTt
         I2XzMHgxsiEDUCGatzkV5gv1KUA+e+cMdhTcZO5gbcqItA4suZqTYejfDmDi18PQTjYf
         XQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793127254; x=1793732054;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BHSeB2tXvPZMKBn/DL1YApAlb2JGYfD53s6iM61Yxs=;
        b=e/eAGpRqnDSSUZ3xgpXVrYKA9MxWayGWemPI7SKAhJ69tcd9rcpX9H/oykVYe799gi
         iwRooQYUrn5suoOr1Kid9F9TK4YWHEvSGHL3nz/NBI41UJe1cGOh4YiWFz+2ulrFrkDC
         tAv4fFxV/+MGGo9OFh3wvGUBhTF9le2JYzS5FYPHxbVu5CKKFK9lV8EhQfSNBgOOJHn1
         U7PaTBdZvRv2DW9FbnASZoQpu2sirLK9w/GuucahyDr55hgXWBZiPhaz+ZAXuChh/9Ev
         Uj81WTMjcw/PVQnnpuJHCwVarql/QK1L+qUuqPVUOqwLKusppdtR2Evhdg8e3fLw17KE
         oLfw==
X-Gm-Message-State: AFq9FYIKWmUPieR4m5HqHOiIOGCkCSrT/qygE3weYGa4gjUNbhkxGiP0
	deV7mYQ6JkuEvOCYJOwbFnu0tUDyF+x/aH5jyZTb8mimVP+Pfkseu/u2KsgnbhfSAtym1YptClX
	lPvQ14Y6iU089qYT9UOlBh0QxeXrKPdH5C7CpXG64tiiZH4m1Qng9RORH29Nuzach
X-Gm-Gg: AYBFou1Lnv0zM1QLqHaayt5ppGUik10rslBghttI/lMZ5CwqBOQ8e/c09bvyQ8dF3Z8
	dPZFxA8aJkD9DdI1Ppac1lwWyD7KA/oTpR6Exh0GLhIOvuoBjJs6Jqq4db1Yim2ljCqVz5ToGoM
	8is/O2XrY0wA10JkaZP7H3RS2uW5NNmVWvcZvqU3HFegKtQbnzi1K7vG6UyDz7KqK2TWFcZ29Gh
	vY7CzACgdCOOsQ/SCEfrb0Pp2fkcHkHFObRiYT4/kLc9HusoFaZTnhNbSU7qA4yuMNC5TdZgQe4
	tf5I3uv95qIUUbstw6hcfgQBm+w43B8uqvu0c9tsn40czNew6X4m4Rc1W1syy7WN1mARgunq2Ta
	mtz4rfrFC/DngJpSw1BK9yewLEYiEgO/pfnwtEublqRl62lrkKLzH5g==
X-Received: by 2002:a05:693c:83c3:20b0:369:f182:8e99 with SMTP id 5a478bee46e88-36a20114838mr489098eec.35.1793127253735;
        Tue, 27 Oct 2026 11:54:13 -0700 (PDT)
X-Received: by 2002:a05:693c:83c3:20b0:369:f182:8e99 with SMTP id 5a478bee46e88-36a20114838mr489049eec.35.1793127252830;
        Tue, 27 Oct 2026 11:54:12 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a14383b02sm8989983eec.14.2026.10.27.11.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:54:11 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
References: <20260925051036.2838210-1-aishwarya.r@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: remove duplicated STA
 state from link peers
Message-Id: <179312725075.435197.858186897775824456.b4-ty@b4>
Date: Tue, 27 Oct 2026 11:54:10 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX//x+2pxT4m+L
 UBgTqwqypWeoajQuc1sU3sRrGuoRJEhaR25CBQbUs5taWBdMOqbzNIkoMyfv32J1P8pPln+yA5R
 uaNrEyQBoVCrnvUZ7JpNTXyx30r8AghbtSfuRhh6Nfs8bS749jm2Dum4qFj6yL7xl6Q1D9yl/pd
 joo+XLd0O1PcrENcZuJABoLrZr82MKPmUlI+clVoJkGIQGIQVwdqRhyCJ2h1wcx0w2P0/Nb4+rc
 jgvZGR91G3Y1N9RYl5Tddp5fRtXMWHuSZZEqQiNyr8Y4GaqD7nFmC3FSpc4oN2iWElYC1mL69/I
 gVft61lBLZd15DEJfLUJ8sjSxOd5Emr0ZGl/XX5i9AuFjoYXNjc8k7FzE/aa7KFBpPC4e7S1IiK
 M+25qRZwOU6CO5BnOMGu+cgA6Rc38p6vhqUmdy1sSuWNyLYIAqBT54be76+tYw1S3Go2QQWXYes
 qk2e2vBhW48rLCZ4v5Q==
X-Proofpoint-GUID: Ztp9xbf1pSrVPfF1zMmCE-JMpH98kbcS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA3NSBTYWx0ZWRfX3S8Hrdw0aHwn
 QVGhszNfr+3sBUApD+hVUAUAoF13+GaORJXMyCJQcBQuaGBqoz0zvFDZOho9LsrhnyHyUfrASYN
 6YV/gqDzBH57+vHIdB10JV4IQYdOJ7Y=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0f356 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gG3WNXbvo0fGP98XFQkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: Ztp9xbf1pSrVPfF1zMmCE-JMpH98kbcS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_115416_118235_F1AF48EE 
X-CRM114-Status: UNSURE (   9.06  )
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


On Fri, 25 Sep 2026 10:40:34 +0530, Aishwarya R wrote:
> ath12k_dp_link_peer currently carries state that is not inherently
> link-specific. Both the station pointer and authorization state are
> shared across the links belonging to the same logical peer or station,
> yet are stored separately in each link peer.
> 
> This series moves ownership of these fields to structures matching their
> actual scope:
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: store station pointer only in dp_peer
      commit: c752394249f8334d146d3f0cb7797fc4c1cb0beb
[2/2] wifi: ath12k: move is_authorized flag to ath12k_sta
      commit: 02121aa4a0127fa87c137b11fdabebc8512f8cc9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


