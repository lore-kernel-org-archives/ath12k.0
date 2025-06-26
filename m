Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD410C83000
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLNCC18u4GYAUHXtrPk4G3bra8STduUZ1GMtNWsHsHY=; b=zacXC/0YSqFQPOtHLYvbz0d5lc
	/Ge9E59260BM7Bp+tIlQdc5DgeT5WnNTqvF6g0AVh8LgydwyDx/B4q1Rorj7uFPbkmTXVsqgqj8z6
	pLqZxxhVX5CQEVVTui1wj8pwlhW/lx5t2nbFTs437zqD7BqKgkgxRmEYxEJe1mgaE3vtvYCkolrkJ
	eI+cnBTXxUFHwaSx0LEWMNqBwq+saK5/NpKjjgl8CDUKRnO8Tr06324uO476DsdNle9XMvAP+FmYD
	uYxPUafEz5vSXb1alom4yvNeMJKvctXfwKXYHsmttt2NEmBrFX7FsAuNAReO761FeILSGp5EjOG6F
	GTbX3pug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuR-0000000DCOA-2fcF;
	Fri, 27 Jun 2025 00:25:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoQ-0000000D1zu-0ElU
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QK5cq1000466
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HLNCC18u4GYAUHXtrPk4G3bra8STduUZ1GMtNWsHsHY=; b=W7Qg2Lgb410fiiW9
	haY7/IO9rw/lb+9dXu3usr7h+lR9bMQAkT+HaaHJo4b/56yJuMgg3qaYf/fMkrlr
	O0+SEl7H/yp2MeFrldG96Im6YP1Bq6gOUPEp9KBhcvUBkNNHXRrZrEcxag1HwIvf
	EuexLl8KFLfMxee7vj/UTqiFRdyud2s36NV8yF1sS2lqm2cGMFGNVw0Gpb2waB2o
	dh2b2GoQJ8JqhM71UK1cLmqM+1BHObh6dloYhlHBebR3gUESeMtolvwyGnnjYfwx
	fkUvlLpl56r/iWKcPGLfmLGq+mDMGzUplI9if6n7b0rig4FFKbWtO2OILl5VtbHX
	ELPVpA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rq51x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31df10dfadso914642a12.0
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979720; x=1751584520;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLNCC18u4GYAUHXtrPk4G3bra8STduUZ1GMtNWsHsHY=;
        b=Xgkg/JHebmoWdkXOhOdXT0fqgmVORVQdo5zLQWt5bjqoVLfaoDKm7hDCcfPNdQzdHy
         +is08BM0yeWmXE0XWU4S0cA2UN/bwQfDoobGIwEy6glXPbVETfplmitgLoJIuLaOqGBH
         g7d5kaF8dX00lWmUfvT1EV7uZ43b2cuE5TxjjoN2UkfZ1SWmgoN2/Qbe/ch7siTwHfi1
         W9gGqrLZrsVCWkbf+EsaFLsnXj/YpFj5bPdNAh0XAtahlgm5PDlx0q9BG/mf/SMFmlaM
         z1b+jJ58VTA/OTzeFMa3CyH7xXYnA9kO16aq/WYmsbH0WmvqCvY5+ZsWiZsrYJ5EEfVO
         m7gA==
X-Forwarded-Encrypted: i=1; AJvYcCWzKekIuXgVrNdzRp0KsCN4Iz04K52Xa53DJMtCRMc+/lp2QOCk3BQivd86OaxFw8lZqlDbf+s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmQmL1MrTJ1l/qcPDfSeC37h7bGynQwBTctJGdpcPKtFj0oaDy
	0IhOHqy270/o72XmozRjgvRmbaab24SNGWXjDqsAu5w71J44sVxzgWHFTsBKI/CPaNMbOWzc/Gz
	wvIpqPX6UgPwU0M2hyLc7VB9cfa1SA0hYej5F9GlcflLDv70tMXgvJGAOJc2REHvGXlWkSmzN
X-Gm-Gg: ASbGncv7EIMkDphWKDPlEmC2nzn8lSDCbTTg20JaFiKqKg76mls+LY4DPiNgZ/9G2qz
	/o+fS0BrPlCZKs6aSrsPj60D3L58u0O4QVboDGB+bBh+zKIl0E81Rpjs8ZFibs/eyoEA/csY0N2
	w/J91aaw9qpGMAD6+tyQUaqbObEKvwH40YE+7OGX59GkAFWSC/G924AwA3E5h2VNzLMw4d6JEDw
	ydRjqbqX5WjMw0cqaL7vjNszoWF//jfMmi2h31ZwMo8iFrtv2897dabPzvDEOZYs700Pzdog7W0
	zHe4kMHpRC9C7dEx5TPo//l6am2ALywC0R4xCOI5XY8/bi01ejUg+agpLh0=
X-Received: by 2002:a17:90b:4a07:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-318c92e3185mr1037329a91.29.1750979719685;
        Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHr0zfQ4LaAItTUYwvb/LC3Y3GvwyEivrz0SCmRrszUpGz2KrLs4Xxvy9A0We+P/mScdNUhtw==
X-Received: by 2002:a17:90b:4a07:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-318c92e3185mr1037292a91.29.1750979719198;
        Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel <repk@triplefau.lt>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250617084402.14475-1-johan+linaro@kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v3 0/4] wifi: ath12k: fix dest ring-buffer corruption
Message-Id: <175097971842.153431.2750880388406500555.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685dd489 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=HENjWuboO2KBCxN4OrUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfXzX1F+BcyIN/v
 0+IJC9eywh77aATcthdV8UVtFArGS7DfYq+YxUbyzV838svTKRJn87QDK/r2PG+PFfk87HIEjtH
 F5Lj47bG43doVs0HYYLYNR/hDn/VJ/EM719QJT1uGhPnN96dDGUSvAxQUgrr7H1xoGBwwxwTgO/
 TQhGBJCsxN9EQT/QrHC02kNQTh1/6oQqR8aePeKnfWE8JSuvU2f7ge/cZy00OIFtsrtYka//CkF
 texlGywszaI+ki7i0OMW1xolDe2j3RaeKqn2NMpPkkkCuZ6Xz90gfroGzRAeazMjReEWW0d8/XD
 B75u+WZBywSwBHiVu0e4mmuRY2bBlRVFNskAhKRg2DCgP0Fv74J7MUxBF6WeN4LVvHEZ/SSXXAD
 4S/Dc2Bx+W9cC/Vo65VencE4+h0OoS05EhiW0vWymkNnVJSsiTODqSD2imyKP629e9jWOw+T
X-Proofpoint-ORIG-GUID: zjzXIublvyZQ18LmoDqyURypRDVGeNjC
X-Proofpoint-GUID: zjzXIublvyZQ18LmoDqyURypRDVGeNjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=910 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161522_219705_F923C671 
X-CRM114-Status: UNSURE (   9.11  )
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


On Tue, 17 Jun 2025 10:43:58 +0200, Johan Hovold wrote:
> As a follow up to commit:
> 
> 	b67d2cf14ea ("wifi: ath12k: fix ring-buffer corruption")
> 
> add the remaining missing memory barriers to make sure that destination
> ring descriptors are read after the head pointers to avoid using stale
> data on weakly ordered architectures like aarch64.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: fix dest ring-buffer corruption
      commit: 8157ce533a60521f21d466eb4de45d9735b19484
[2/4] wifi: ath12k: use plain access for descriptor length
      commit: 79390f613d639f7ef913377719cc5094357e53bc
[3/4] wifi: ath12k: fix source ring-buffer corruption
      commit: e834da4cbd6fe1d24f89368bf0c80adcad212726
[4/4] wifi: ath12k: fix dest ring-buffer corruption when ring is full
      commit: ed32169be1ccb9b1a295275ba7746dc6bf103e80

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


