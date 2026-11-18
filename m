Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90390606A320
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JEUgNGHU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ErDp4+kT;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IsaEExFU;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DnK6Dis+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=teZHTQL0TRLvGXls+PuySPJxlKB3IANG/MwhonUY/is=; b=JEUgNGHUNWrTOG
	658kcF0ku6FSdHtIFzdaA3eO346uKuySiFHL6dAuhApk7s/4mLoMmLWW/NfRvRW28gPPM8XOUYjaN
	OPaZdU1iZ3PbScGd7hdrlv8RT/z0vz2QG8riEZepJeMmh4fXejQw6lbyauJBvb5uVVsfb7IuxXBwn
	s9vH5E0OF074RpXmx8zXvhpsiXl60V1WHdVQQ/5H6Vc+lHyjxSRXTK/82JdtSmhhHybjD+c0RhaTU
	Jkdz1doKmsZvTDY7B6OzuSG6AUH7hVvGKQ197lF2DeFd2IjoZhZ8wu7QVlVb7BSGHpsRBStVstq0I
	h3avgOp4lmUJwl2GQAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj15-00000009eez-1R13;
	Wed, 18 Nov 2026 17:00:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj12-00000009ebh-2nOg
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:00:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=teZHTQL0TRLvGXls+PuySPJxlKB3IANG/MwhonUY/is=; b=ErDp4+kTfaAQ7x6uk8jvzEGFtM
	8vV/eFOTtY5+6BC+9OsjXLh9GuDO4Ftj9P9M06A1eV8MB0qvDSe93WzIxLoVxTyF1eKbh/aiTzMdE
	MRYKprq9wWoxJ1zYK8xxl9qfo+GfWdSIvIeXwr90F3wVctUV0uSVyfdzyM8YcxBbmhfih0+dnm8fi
	6XCVGPo+rlMo1xVmWs19BneJFuEhC5CgN0eqH1psxKEgKs28VdZEhSbn39gZeGDHVD1I2Z0mPp+4s
	GeNcGA3v0SUkpl5mF/lQ2LOi8UYJpl06eBjkT2drhfbmOY1CoLZuzMIyMrU3QIFz6PODmVd/HNwSl
	apUbOQUw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0x-0000000GJEq-2uq9
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwMaH3925920
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teZHTQL0TRLvGXls+PuySPJxlKB3IANG/MwhonUY/is=; b=IsaEExFUxAjybtSu
	PSthHV9IDK06fMxCWu3vFxCBSl9k68Wep/De0IHZHZKGAwgsoGo2CyFzM46522pF
	+tfGzURdRup939GdxbYO9Pc5hNp3gX+pChTyWL0amNosB7JOBbfU51462jOLg09r
	KOIudBFLYrZB43FAUYf4Fk8AQnOF0G1Ge82ELzSSskhoWZ8JlDh6S9OW6OK88y7s
	JYb2JwTbteTZknIeYDu81KDT73H/k3wRl7dnyqpVzHcpBlylZSvnzSW1/cHZ65T7
	vx3aZ6MfDw4v8Oa132FLm5J95sxj4AERKzJ0XXaTMGRWg9Q/dW0+Mrzeml4Y5mT+
	p8xuIQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg057e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1437161c88.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021199; x=1795625999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teZHTQL0TRLvGXls+PuySPJxlKB3IANG/MwhonUY/is=;
        b=DnK6Dis+Fiis8WCwJWfUYzJ36sPyGs884TUJ/zcIauYkQ0FxzmzfZi8LsEIYxpWees
         T7cmoBWAhCISlAe56uMp/NOB4tXi9Z8bjrSXHTkuaBMnjYsCsF8uL6YV77qsdIj+dt2b
         TG6jCOjFX8XITipimbnhAC9f6I8V6wczOSu/yclOTsWt+ZuTWJPe/Qk7lAG7qCPH9e4i
         LslO7CNJ9VCld+yY+ZNGxYFMw1O7h88EZ87x7nMA6gqC5Rwe4o4ii6FPXVgDWjNmeE3t
         uRXTeuRJMe8vqKolP7BdyWvkTopa3pgH/6HYEXz8ge0VwlRS/Vt7O9GRDUWHc/jY1uID
         k5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021199; x=1795625999;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=teZHTQL0TRLvGXls+PuySPJxlKB3IANG/MwhonUY/is=;
        b=J+oXwyeFL7ZOEPZIJezx79zJycgcwhX62O4zb1mqe706UGgm4G4mWeF+wKamwJ2Sbb
         QnsnYc6fxVy0KtfKfNyAogMC9Ivf40qxNtcaIMDs4X3DKePwjxXrd3Hk3VQNW8F9+qTT
         wUQg/4MkcgEYCP6b/tWr6yUbRoTvcTZYeFVvJicOjozA3Xkdb5Wek5TiD5aEVLwrfIsM
         kBrhzIIVVb/jrCSV81zGvGsMT7HZVNNKhek4nTgrweSKzZxKVH+OHikI6UjXM6fTUGlU
         sk/mpsOjkP1CvUIoUeI9G+cOo0pB0+pU0fIUIrCecucqbseAE9xomzEzSAESkF1hakv1
         Poug==
X-Gm-Message-State: APuU4Z9m38hm61P5/mz0mRAfsOjY7FI5Bbz8I3Wv/+MXZGuvei76UX0b
	tx/0FSzP+jMdboddktgV2bH905tixOfwt/N9Ph2gMI10WN0LyxIgvymcHqel7KKjNNipeWMRw5P
	zBDqSUPSXTpiBNTQgeasGnfnO9El6ukAnElckypAiQML0PgqI9xbJVlPStoPJGopHiG+gSsIx
X-Gm-Gg: AYBFou1v4lSvF7IPQNRt/QGK7ofzT+LOKrdaIgqsnVonwP4HdPaLVTrbdrxWfOL99Zv
	OahXT6sB9w60Cxcjr02j7WETJkLffIiowyMp/HDDqiJc6slCN7loblKd1P4IXGxNDQkmExBWn2y
	PA3KY+gJSrt1DF8crh2ul9L60GWcYfoYwJhkDOwIAfY2LzmONXTUan/BK/w3SvTh0yJgQMAsfAQ
	Ajt3pd2ZQyR6h7FmXOIc0zubLXjgUYlyyKfhlFbxhx36NB65jszCPKXMUCq4PVRbGnZf1l0O4k/
	K/J/rUNFWWI/4FrCUES/8MMuZekW1Ruhb7PVZAgDtmkDd1xRM/bXnOS4R6IxMxE1opJVTAKokpu
	RJMtNcpO+zlgTquU9BkFW6RyPHxPfIo4xT9kmkSp53SknifW0Dh7X3lIntrqqChf4f0n7oYwXZG
	46OySOuc1Pia4jPDLVX6AMO8ONUIPp
X-Received: by 2002:a05:701b:455b:10b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b543d09a17mr2737981c88.9.1795021198716;
        Wed, 18 Nov 2026 08:59:58 -0800 (PST)
X-Received: by 2002:a05:701b:455b:10b0:1b2:43b0:4794 with SMTP id a92af1059eb24-1b543d09a17mr2737775c88.9.1795021193096;
        Wed, 18 Nov 2026 08:59:53 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:52 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20261118030601.859-1-wenmeng.liu@oss.qualcomm.com>
References: <20261118030601.859-1-wenmeng.liu@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Wenmeng Liu
Message-Id: <179502119242.3425953.3017534554372930660.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:52 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: --XW8Hu8_I8mD6Tp15bwN4dvjG99Ftxz
X-Proofpoint-ORIG-GUID: --XW8Hu8_I8mD6Tp15bwN4dvjG99Ftxz
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdd991 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ia6IoIDXIHM8y005jqcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXycFXdwASkFsI
 bhxzvjFvPRBRLrdj3byH+naa7oyrtDC4JMEMVq4eKLs/DtGbLO6yy3NdInQlkUXIUMbemsCxPfc
 8HjuFXLDYIutg3EcaeCFh5AaNJGEwpk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX2DiyT9Y+DrMA
 9AT/I6a5+Ej0i4m/kIk/TWvQpFySFvqJObE76JJlMH40ily7jqv/lNpO8/HCjRa6fYY0XZSDVIl
 G+gXOup26qUAHwFShwOjZJf5FAVNhxr4fB66W8WOdiItj5iyYxOOHiFfLDDW9HsOzbU0wUsbeQx
 83V2DYAlEThvzlN8TIwrm2qS79YRGqvdnxPG1K2yecmz8I1fsNav8peb/1wsmS3+oriVsupU3H4
 jVUDKWdJL3appb6TsysW2pV8L4cpvTHA5/J2FYpgUPt7n1SNZTqjr4nnHRfXIpWY/KUMbBc9ETu
 e+P9ok/gnWzKwiwKVfsAY12Acvq72JRlLvAaaBZF39TsokT61nHIEYHWmfHuPhv5FowrF8Y1Ei3
 s4zV6r5GaML9lShQm6qdd8fpvRn6dTM4GrRmTfAjj9DAuSAtvSr0thrG384PoHGG/9ofMHCbmeq
 ZiGsM9BqoKSE8pKulxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_170007_914202_D981A19F 
X-CRM114-Status: UNSURE (   7.46  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 11:06:01 +0800, Wenmeng Liu wrote:
> Map my previous e-mail address to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Wenmeng Liu
      commit: f015ea27f6e8b41518efc83cebaed9316ccb09db

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


