Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B06DC87FD2
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 05:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bmXjPpDHd0Cgpzu9CL46gO7J+euneT5LSuqRLfgfzJA=; b=Aq4i2sFpY2BtXmD4lyW+Y6Y8+Y
	Mn2x2WdSn0j6OxC5ZIQYaMmE5Likki94CV864ajYBa9Ibb+g5Nz4zIneyGIA8uf8rWUkYzASL7esQ
	TKtM60HCc5dSJkD1HO0ZbHBms1XQvcdTNPzhA0C/WT7Wib9LSMhxvHxckb57Qyn2zNUDoSmaDV9sn
	bFzt/b65QnFCec+5ErDXwue+L0XD5oJd+QfqT9qCs4nzvoVdozvV15rrJcoHgIZVSj5pFthD2/ZDJ
	ycTgK8xngqcgUJo5R8GNstnMGOjIC0G8QW4wO6x6v1E+Oa0YNs/JrClVFW7SDAc+Otw0eCiuV4zu+
	nvLrgppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujst9-0000000HHmI-2REg;
	Thu, 07 Aug 2025 05:10:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujst6-0000000HHle-1O5F
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 05:10:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57715gdM022161
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 05:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bmXjPpDHd0Cgpzu9CL46gO7J
	+euneT5LSuqRLfgfzJA=; b=aqrs9qkhORFhgqiUNUP0pYhKt1VB6oMXbtys+wIJ
	lllsaCtVARHRehkk2xlv/zI5+koVePpz1iNe+b2INzZibBh7Yi7rE/W7pjymGhR7
	olOL9jaES0sYiNoNsYhRTjye27XU/mHsU5fhF7dRyn0dkcHHIhRCoJrUaPVv7qb/
	tBhJGP+3QysAA9t6Kf1KVZdqSLrMWD+pb/tsoIbJdXvKYlEBGlIP7iGNNxnLE1UA
	pIqUSY5LiyjCS8JsZSwEqXI9TEezGgVPisDefxobZ0i3s846grVh7fBJ5dJhaGCW
	P7MKmhrcytNa2AbShQ8+93IFOZJRLiCohcH8Pl5/C9esvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy8d0wx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 05:09:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31f030b1cb9so1124696a91.2
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 22:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543399; x=1755148199;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bmXjPpDHd0Cgpzu9CL46gO7J+euneT5LSuqRLfgfzJA=;
        b=XPL0DS+OeL6Gm/CmiuiObk5Z7UGs2EMw3yYkH8sKDTq2cZevsG1QKe2VnSQzFOM8TA
         TUi1+NKz1rhB805uTkMTcRUWkit/SNd6QxmA00ukXOgDSYNqvfZAyX6wKIvhcVgOSH5q
         hghl9IrV5DMFqdPCsho3iYXzzSKiIJ/WHrW0gZUXlk5ZfZJAzeShhJWNVuSj5UHkzGAF
         9gBm5FNGNCR69YZRW/f4/ssgHwyg5/zqbAX3ox9TTkoaoMjTkraIF2LLoF4jfK5tBIB3
         W+w6U8zcoyaIs1sVathW0D/FO1wAbI+kVDmEm091csVE7t15MC1JmCfdP0vN9jkbbiBN
         7V2g==
X-Forwarded-Encrypted: i=1; AJvYcCVaPGdM6T4XbvD63igAwDqIMB5itA095WN6XYehyREa58xYJDxof8uMnjI/YPg5mfYwTvAU/OI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvweU0KDjmMIQ5NhdfNCNDR7EOMoWby65ISkA3Ef7JgcIWXpFN
	hTrCHmlsbE90vN27cvABkAKFH5YjnbQLQyQ6hyWi1H9JsT54IJBLseuIUo5Sut9gaJaMNSEzTN8
	HmCe/k1s/m3F4dkltpqKLaZzLjJitqVOqEX2XvA3s/R5n8pVwUWfV8BmhpP+qvfBRYOD5sdN0
X-Gm-Gg: ASbGnctupBJmtyIXq0NsTMpiyhWrfERg0dDiSouoxZFoL1KPeVuFJE1mH8+VqC6EhVE
	Uv3gtJuZqN9k2WoXF2UtJha4DnA6uvaNrrGiBC+W1HpdQKf1EnOwH/0BbBWpmQRWeE03eGMIaIn
	xLr647OO0lwSP9els3IfD2QF88sxNSqal4JpiMCHTTqqr+Nc2Q9dQL2tpCW6Ya+jNbpUEOoj3fX
	4rQNf4bxst9J9HrChIcJUwJmRACh1TiDFs2q05NQr1UAeEah26Q6i0rURHKMgLSQ6nT26cJ1/Mb
	k70csrO+TuWZjfBF9F1VaWLtQZspPIwOv1lXGLvGYxSHwBpQFzFc9NUwEygmJmKEcik=
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690694a91.10.1754543398726;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG47kar2q36LtbPQN4NmJWmgREGO2dRSmwYDlKD0mRi6OR7+kX7FHIYLR3UKacYjpT+SbKlfg==
X-Received: by 2002:a17:90b:5101:b0:31f:3c3:947c with SMTP id 98e67ed59e1d1-32166c2af67mr7690645a91.10.1754543398204;
        Wed, 06 Aug 2025 22:09:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b77f33asm14674650a12.5.2025.08.06.22.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:09:57 -0700 (PDT)
Date: Thu, 7 Aug 2025 10:39:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] soc: qcom: mdt_loader: Fix check
 mdt_header_valid()
Message-ID: <20250807050950.n76f4vtndgjnujbo@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wgpgwf2yq4awig5cztgkgm32h6zjtqzv4irpxd277gwjydofzu@f3zb6t4iyahc>
X-Proofpoint-GUID: V4JxPtE53WZ1HP9kSaknP34B-HBX77nl
X-Proofpoint-ORIG-GUID: V4JxPtE53WZ1HP9kSaknP34B-HBX77nl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX4pX4nOHFGhW8
 4D8NTocrLL1kfWBZC8Kg0icoZ4A+4IprwA18+XDH1N4l6vBTINHmbIZiOLlNWeh6lZ9k4ocqbhy
 qE8hmnJfcnV39F8nkeBsar0EDfYmRfo27k4glmORw6mmS5jKD3zXP17rY10BqYSZkBtr7JQv4H6
 5vWyMuoRGIuYr4LY8DP+GHEA+Fpr3SvuDRkU6gpNlXlQXpl0v0KI2OEBx3GVO76y6/D5Bkrhees
 pyyIjMbm1kAQCAlwgWASyKYxk8vChUP/ul3583ACh8Kq3/Of+uM8MLaq6azffLemps7FHd8gbJO
 2/vRL55jZKU7L/TypdTpYN7YJy+vGsmpPD/uMNuRxT9zJIVxX415XyN2amzHlGdj8MGiGKOYIyl
 72bgKeKQ
X-Authority-Analysis: v=2.4 cv=GrlC+l1C c=1 sm=1 tr=0 ts=68943527 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=OaSFCp3QGDZU0s8We4QA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_221000_376908_A07E89AE 
X-CRM114-Status: GOOD (  15.47  )
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

On Wed, Aug 06, 2025 at 03:01:45PM -0700, Bjorn Andersson wrote:
> On Wed, Aug 06, 2025 at 10:55:28PM +0530, Mukesh Ojha wrote:
> > Firmware binaries may lack section headers, in which case
> > the e_shentsize field in the ELF header can be zero.
> > 
> > Update mdt_header_valid() to correctly handle this scenario
> > by adjusting the validation logic accordingly.
> > 
> 
> As I replied earlier today on v1 (probably after you sent this), I've
> applied the patch I sent out earlier for this problem.

Sure, thank you.

-Mukesh

