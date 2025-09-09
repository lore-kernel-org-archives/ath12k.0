Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA046CAC58C
	for <ath12k@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RAntPOqg/0XyFFE83IKtNh+7Q9RRLCGHdB6U9HhQMQQ=; b=SAUB2GU1Kpm5w7ZD8rSi0aaPLE
	QLRjblfadFT+r+dz9CWPIzSNBuUOwKqQGVPnU4VgecNSBX4Eo5mPsoo/tuo20a2T/SZqF2h09k/84
	/K/i0raZ9HJNWvbIK+3FZrEuwKq/kJbQMg39GldBvPLOlH8UP5vkZRCwhF10cOxnomXBIBLxkgDWV
	ovPBz0pe6SM4VVZQLo5urrGpfICbqxrzU3JVwXf49BGLNBoVD67P7dAXdbwIE1YQtuvLDh2PajGsE
	C8XUVi2yAOaqpBn6/FewgjPOz6dAkFFNJ+LPbzf+hHNJp5YnwTI4XcYgMXeNdIprIvUAQJ8MRW3g9
	F3LbMqpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw22y-00000008zIQ-0IOA;
	Tue, 09 Sep 2025 17:22:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvzu8-00000007wtV-03uX
	for ath12k@lists.infradead.org;
	Tue, 09 Sep 2025 15:05:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LQMJ009051
	for <ath12k@lists.infradead.org>; Tue, 9 Sep 2025 15:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RAntPOqg/0XyFFE83IKtNh
	+7Q9RRLCGHdB6U9HhQMQQ=; b=RTCS4xiWgP5jQD1FJtOlozp1b939TWLW21nNjW
	8XzggxOmspmJj2+nM3VCQJepG12Jb2LswZ5aDxewEy93Mmr/VcKGSad8RqKRtKPG
	6xw8MQozVjXp54HgBfnfHm2Pfflg0ABEtAagU4BlGcMvozqs5jMc9j3LfaoEluS/
	QIIacHYVXhIGVlud3gwiZOgQ2fUv1AgNrqudmF4r6TzH2VeEeOpQ0U+l+fikBlAT
	C+HglwVZSHZ7K6y5YwOC0P11aJ8dNuV+rsykAWyng4EPAJGtK9/+gilP9F1x6Ei/
	FHbF1OnvqwsHuPiZ3lBr83Maps4hcw5V2y2aV+7KYca0o8mQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdwdy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Sep 2025 15:05:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24b18ad403eso53000385ad.1
        for <ath12k@lists.infradead.org>; Tue, 09 Sep 2025 08:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757430306; x=1758035106;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAntPOqg/0XyFFE83IKtNh+7Q9RRLCGHdB6U9HhQMQQ=;
        b=UoP0cBYfJvn4lNVoqTxtySMo4odaYmsNXzsWepShKFEMAYJ6tetyP6fSP1BHpsKvvu
         2ovN/NBuKGFibj/P24kVIljh2oBYAY2HjSZdYlxbj4YfOb4SLJIoCtWF8UUlEQJPDRJf
         j+scIB+Cs4WUWVWl5MhJwTzf7krGH3M3Jiu+4rDXr4YsAYUGM69PAYJkWtfx/qtYUy5C
         D9RLzYnhPhs/qdXayK0R1V6Vl9Jng+OfyEq1I5wYYRRYGN5pR7xj+TSyDyRK4zzWuuyz
         Q8ajMcRJg+TGthzjpH8MOwdaAZa+EFTHkkzqOW7KdKnZBHg7ZFCtWAtPQRJguR93VAEZ
         H0cw==
X-Gm-Message-State: AOJu0Yyy5KPsSY2pdeB4Chjwpra2ZQrwabVEDd37rudoo7DU9/BFu7nG
	RzOpNBPqC40Z9LBlidWkc5KFLbcbEPHKXFmLbhoqDE2HZr6DxbMBsdmtDuJTGBCbAcgH4wFQNmA
	9/P28MOYQ5HXu3fuI0rL7KoHSAlcsBq+Y08/3VldEv/6/Snd4j1TqEqbv15A2B/It
X-Gm-Gg: ASbGncutuiqSr0ols00+J76/dEyxcBdijAr3vM0h16occFxYgfezI+9h6AR9KuhRfeq
	fbk2kJX9cyPNexgPHR4k2Z8FCHdJ/uwRMbOR5+WzVCjvN2m7bNEzaJtMFx3OgA5nTgkKBDYX27b
	xsG0ZsMOGuVXXZkKIjDe7oLOlH8f5HXa3R572yT5bczgjUngrEQctVbc/h6dTRJNrdUzOzEWlEj
	IfuknP5kolMk0oxWOnHt9U7Rc3UsFMD/lp6SebIsVKlnji+GAOfJ+go61NyzOObl8o9r5+4kCJx
	l1EcxSDwHdo5fRpPwa3Lruv/4jiXOIBIuKJ16yzOMJl/7A47/BYpmS6lzehhefRVcMC5CfTykK5
	D
X-Received: by 2002:a17:902:e541:b0:24b:2afb:b3f2 with SMTP id d9443c01a7336-251788fcc2fmr155542925ad.14.1757430304386;
        Tue, 09 Sep 2025 08:05:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb48fxPq6mEUOM7DGxxKSIV9zoJtKUPGkijzFiKPpf3EvVe5kxlfkcerNzemxmf2LpV5eY4Q==
X-Received: by 2002:a17:902:e541:b0:24b:2afb:b3f2 with SMTP id d9443c01a7336-251788fcc2fmr155542015ad.14.1757430303596;
        Tue, 09 Sep 2025 08:05:03 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2a921755sm508065ad.96.2025.09.09.08.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:05:03 -0700 (PDT)
Message-ID: <3072c24b-91ca-4abd-9fb9-c24621bbfd5c@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 08:05:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20250909
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: I0l-InPthLr_tFHUwJxsKTVKS1rrBmg2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX+NwWybK1JhzG
 dsxpSrcRhoIX32s5n/WEP0QOaIiADWI1is2e8ukujDdi2yga5j1iHNmUgQ4StMiVZvAeZ1z/F4z
 ewPY0I9j10ru6f1z0smTSA2/lSbdA/gGVkIdfkobM42gCFgYS32MbsAjLgL2vjXoQAmUtWzbOvX
 rLRCQn09Azd/lrGWS3BGdvmHGFFWfD3xaSEQ6fVlmc5aisbn/6HDDIs2ZCqLybaIlPRxSOHXVPp
 reOp34rrKBFYzVK3Acb71uQO/z48doKjvArr1H95p1R6Gy++5XaZTd2ydEw2YeU8nNw0hfV6+h3
 OLKAmE2QonH7Z200OAKPPWPsqwhG8tR+vT0bUEP6no7mZ99wFt8HNE6nqYacUqSa8HAkgUZjJxv
 G64T2vQF
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68c04223 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=irr5gHPzP_QwJIvTEHAA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: I0l-InPthLr_tFHUwJxsKTVKS1rrBmg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_080508_136852_FBC73173 
X-CRM114-Status: UNSURE (   8.44  )
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

The following changes since commit d69eb204c255c35abd9e8cb621484e8074c75eaa:

  Merge tag 'net-6.17-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2025-09-04 09:59:15 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250909

for you to fetch changes up to 82e2be57d544ff9ad4696c85600827b39be8ce9e:

  wifi: ath12k: fix WMI TLV header misalignment (2025-09-08 09:45:18 -0700)

----------------------------------------------------------------
ath.git update for v6.17-rc6

----------------------------------------------------------------
Miaoqing Pan (2):
      wifi: ath12k: Fix missing station power save configuration
      wifi: ath12k: fix WMI TLV header misalignment

 drivers/net/wireless/ath/ath12k/mac.c | 122 +++++++++++++++++++---------------
 drivers/net/wireless/ath/ath12k/wmi.c |   2 +-
 2 files changed, 68 insertions(+), 56 deletions(-)

