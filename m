Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C48C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 21:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLor2fs01SMFYiijG/KuA5E7zh5MzCRC3ggS6fY0D5s=; b=KD4jYI7a0sxDH9r87k0OErhcwp
	vHi722f4r5q8+6tcDMx28Xgqi1KtY4qGksqRsQXOS5EAUPnyBe/7W3hjyJljKCCvZUqM32peOTLzk
	Nq9SkakCTXvQGCBBSA+mm3GVc5s+rpTg41U6EOQdfmDKJGpgQ9dCYZQmuOn71cJrLHSj4ttgU4v2R
	AqCKj65CyYgeueDl5b64IbaavnoxweHxF+zsESD0vmRsowtOpwv7WKBTGaHGomRuG7B9bDFiL/7+m
	N/SFLMbA2m7TBiZJiIeYJ8vbquTGMsUDPwmn3Z503wCWik3l45UU3Km2zb4reJc+7MOcQZfwEre2u
	XSHOn6Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyW-00000000Enj-026g;
	Tue, 30 Jun 2026 21:26:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wefyL-00000000EkF-00ON
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 21:26:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UJDUxb2881266
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLor2fs01SMFYiijG/KuA5E7zh5MzCRC3ggS6fY0D5s=; b=jOsGcm0CaPyVza8O
	Ww1WuQE1f0WcW8VtrxPOSZLP/nycSekeIXAudNwIjzmy7YOT1367TQccNj9xlB1y
	sTH0cs0RqywvxkZEuJ9Jtb6KEvQ7UvP1VD30q1AJ2BK4W3fdI0MVbmuZWwmAgGRX
	0VhDdq1IzF3Oys+EWMFTmRs2yL5Z+4yPBBkCE2OglJgkpD3xY0e+7WY7EN1gpIZN
	I3jUWkKKRCB5FKN7Rm58H9CxUy1auWAjjN09unLLte+mjHaHWHD8/hJqIv1R912F
	y3Nwn17CSCg78UTk9Kri0kc8aO5jSZan4pemqOKCw6M1LpCBOqzaVOjO2GOWz+kA
	C7iUaQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jtqgta9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 21:26:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so859684eec.1
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 14:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782854784; x=1783459584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLor2fs01SMFYiijG/KuA5E7zh5MzCRC3ggS6fY0D5s=;
        b=Gwd8XhC69qC2fRmhHj4tbn/gM/hbYux6ffP3S50v1sQW8tut2pxPRHf0o0kYIx5dED
         66sgA3gr0toBDj6aeS8YS1G6vs7ajuy2e/a81myJh+Zd1JtcAALNkKiiIxF6wN5pnH+D
         cS/G7XZMOjo+Ibm+PDeUDhuqh/bdLiOiWcxzxd/AM/2+2wcrWf2nkwng+cHd/aj7Bc5o
         Bt+OywvoY8+W3h54CAynEBv/G49Z9qizOlj/agRc/OiWcMfSIPZw5jpppWaqIU06nvyX
         hLADODBrjiZq7qa8D7VNfudxUELsCYdno7vD9t7Oy1ZHoBhbeWgvwhtqu2PHDf71wbDY
         l7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854784; x=1783459584;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jLor2fs01SMFYiijG/KuA5E7zh5MzCRC3ggS6fY0D5s=;
        b=QH82l95zMCos+dmYe56teLkDjT6At67fiCf8LSDqaByDdyyEGdI0wVeI8YXX++MA2o
         on6PIivCD68DQiNdAnBiPkm3ADaoTl+gK3hpV3STNxWssQBJ3T4fnIcPnhgr1MURc0J/
         rpSVGR8HsHZVMHFpCKJ0wYnkPD+m/XhkRvdGoYpLPwTV4fdpEAcOTpHAKhgCnTlsOG9y
         cF385gB4fgnu7ys9Ooo4136cxrdfeekw9u2Co1IixRhZ/p7zes8t0IeXxXqrJRa/1LAL
         VFzLTS1uNw1YmdYwvfFyqTP6dA97AWYLV7DJbzYomKrW+y+bIq1WZ932QsU/zFJq/e81
         Lk8Q==
X-Gm-Message-State: AOJu0YxjcsNuatZ67V9g1ViQqZ/e9tLxiJ+1yqrrnp0vdwtfYfZ5R43s
	feaVjI1iUIMeYalHHJKiNrKH/IUdyk/xvIlNvNY4V76aOG1knLAKkvar3liNTBNre3Ht/d0mReM
	ZSB3+iAZS1RtU+86G7RKZ5SX42bnvAC3lCAiKGIVnSitT9mVwQq7c5NoyF7gy/V9p7BgPryqV
X-Gm-Gg: AfdE7clNuH++Byyy2E4G9sEXZyRuVSSfLh25iC/YQ6h1W49y1+4HjLa1hn0MqNa/L5g
	vOay6MvJ4y6s19BPJEfRUxd/ONbgsmJkoWYs74FEDfNJc5yAcRATvFcUaliSX0Dgk24SUKnlRuz
	+8iOXhjDibuiM1Uof6KtrknjJN4gpNglqoxan7cLCllaIc3ug34TzyOKjzO5oxbj8Dj0jBRvZiX
	AjfMMK35ctkpnKKLXETAc1o7Ea3HH7qPC6CL9Qlp2U/l8A6kfHMbgDobiBVRFB6icO1ebygUrK3
	PQquuMvBXAf/2bb05kTVDWS8V5rLAjPH6c/uKlXhv/uNmA0wgh8G9EOMrkkyLPkWwMWP7ikYngb
	b/k1MgzLzEma1JcTIIH6wq5ustzjPeFGbVB6hd/Izu3uXzyQcKQk2rrI7oqDH4aSh7Q==
X-Received: by 2002:a05:7300:6c15:b0:30c:c3d:bc0d with SMTP id 5a478bee46e88-30ee129b412mr4331388eec.18.1782854783910;
        Tue, 30 Jun 2026 14:26:23 -0700 (PDT)
X-Received: by 2002:a05:7300:6c15:b0:30c:c3d:bc0d with SMTP id 5a478bee46e88-30ee129b412mr4331355eec.18.1782854783336;
        Tue, 30 Jun 2026 14:26:23 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300b286sm11604046eec.12.2026.06.30.14.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:26:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260623035104.3765404-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260623035104.3765404-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused QMI definitions
Message-Id: <178285478229.1590147.2490540911535739296.b4-ty@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:26:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: w8N1k3HhzV-BuWRrea0lFp5JQCkGcV8S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfXwCBVaNcWuM8y
 zf/MoUgvLVspkfGa/W6OcMqibATNCT89fPTYHivD5ier40grCZpD2tafXeaAEePntIVCB/y12aH
 WkuCUCI34F3DW0dSuoEbtBcQEgvJY8Nb/1fUObvi61xu7XL+F3sLi3ZvMSPtCKPWQ/ydHrp25B2
 9ZJKvLo/BppqtlQ9TMFXXDhBJM4lCRpqYUKM9x5oM1GElqpoww+GLdxhR/zWgYZzz/BFtqPjOu3
 NjaOJ4Ju92hcRFNCeDXLDAIXrqz7HFlIFUGwGpCPq+w2NNcnbJsTGck+mnf7xmPlRPWP8HOjAYE
 /nmSYiWBsxvpD7ahI5/HaU01UPbHX0+P46V5pD46bUuu6RejH7GlO40sIJz64GjKUatoI0EKu1h
 5NWeVfsqafx/0LQoxcOY8bgoeeRHd3qt3IvU83rpNo3aFJh8PXApKk0iSFmJbZOmCSPXpDhxrU7
 7HWwJP0BOWqAGNyPATw==
X-Proofpoint-GUID: w8N1k3HhzV-BuWRrea0lFp5JQCkGcV8S
X-Authority-Analysis: v=2.4 cv=LIZWhpW9 c=1 sm=1 tr=0 ts=6a443480 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDIwOCBTYWx0ZWRfX+XD74tuLvvhi
 YCteNyrfrKvv88iNja1ONFdnBK5NZN8+6OimPMLMsXi/ZtnBPquEh9NV6k/QVl7gysRb0L094sE
 XswAy6VDZ1wJQgsMChfiaxDmvDdBMqg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_142629_453215_D5D14F6C 
X-CRM114-Status: UNSURE (   8.95  )
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


On Tue, 23 Jun 2026 09:21:04 +0530, Aaradhana Sahu wrote:
> The driver contains several unused QMI definitions such as response
> length macros, message IDs, firmware segment length definitions, and
> CALDB address size definitions.
> 
> Remove these unused definitions as they are not referenced anywhere in
> the driver.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove unused QMI definitions
      commit: 007b638ed7242daeea7c1078e8f732d127c790f3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


