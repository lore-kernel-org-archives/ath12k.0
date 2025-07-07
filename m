Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA16C71130
	for <ath12k@archiver.kernel.org>; Mon,  7 Jul 2025 22:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kObBHOTy4GemSrwADqjuQYpPPym9U0e2cueEvewwqA=; b=VGX6hqUSKcaHes/K0ViuN/XCdD
	/PTLmxw2pjarsdmmO78QTtYSpG9scvY6khbW+P3CM8SQdwPmlDov/dJWmxiEuTO5eF1uQZ8fISeUQ
	8OKZD3q9Jw/89AcbdoB7GZgu8pEyM60vqkTg23pTZWs4o7KQU2+k+x0wVYlo8yXL8mDbkqb0RcVvT
	QZNikvfuE84U3CmNO1rPMGXQCCXW4Yr/hpgVrojb4m4F3TpF3wEptykpCcBeSNtW/Dyx5uh2gV45s
	jvK8EV8H0o7sTtESEdINu6TaK2D9uLAF+ErfynlKQ6P2tUxEpqA3iP1TNmBH9I0E5ReLFy74Dhdo4
	YL3ba3BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRn-00000003ifM-0pFz;
	Mon, 07 Jul 2025 22:36:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYuRk-00000003idp-1Ftn
	for ath12k@lists.infradead.org;
	Mon, 07 Jul 2025 22:36:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567K26YY027231
	for <ath12k@lists.infradead.org>; Mon, 7 Jul 2025 22:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9kObBHOTy4GemSrwADqjuQYpPPym9U0e2cueEvewwqA=; b=dAH8uzZoSsbI5yBM
	li4RLnOkYtr0PyMckS7IACh6Y+ygocCtb/zaRBCXSBhA7mU0Yeomt0knFEJhzp9C
	v+3HpSavpoIRRWjhq8QBWvJXP0FemWlCTiDS2cKcqFD5KJ4zlRGTpphrgAUur+Up
	30+sbE7W2SYXHQky0PRtQx5pwbAHeeKOSb5jiQLCg0L9FbZ5jUrwYD+k7qCqTA4u
	bZ8quy9D6P8oKR16RY0GoqEXRObmeMWZB5RaMKEYCRmfRMqeIWPoQR0UAycRzf75
	/5aL0E03xcplKkbgZONE8Ty5AE53gPKso4cp46B12hbsrqOYRANb1JQe4rFsT3Yw
	oi0XbQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2b138s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 22:36:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2369261224bso42001595ad.0
        for <ath12k@lists.infradead.org>; Mon, 07 Jul 2025 15:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751927782; x=1752532582;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kObBHOTy4GemSrwADqjuQYpPPym9U0e2cueEvewwqA=;
        b=IodTkq+NYhiJHKSgpbgChVmeIA1S+tHytsJI01OMX8XVajvRxVOMPwFEs+57XqBBMu
         vEu+90qXxbW4nbm5Sg9C4on8t1I8CXnvOWwS6B7NBSUB4x8lDw4ZnsivonhBXbXFo+2G
         dA5c4QRkRoCwfsoZIdUrI9JdMK0ITs7vh9mwVaf6DnQr5iI8F3p6GT5ljq6HPl9+b/U+
         5QZ8C/+zDOgsZunbPpJ2YBa0LSTU+eIlWh2VqIYc+eYG/6K5ilbg8bAVK0yU1GrLltL7
         GyT+Vy80otgwYiCvLfl2ngn0JGqTmKrvwtsoN5vVWXyen0SBW44JoTHPpTP1wf72eCeh
         lDRw==
X-Gm-Message-State: AOJu0YyhBOSrMwwlVejuTEvUOQmVjQxipVE/35Bin1Ru6RGB5oN5JMCu
	5znJIu6FCNdEbFvX9N3w+aMUZ7d+WEqJjfqus1ZWOzNe74IHC/MnpEBv55JQ5CmoKK3eYillQ9q
	gLsl+p+8SKmvCs7TX65aWoStXAh0D/ifO78AimcYwYFSVWQuY4lHlat63UYcwOArW
X-Gm-Gg: ASbGncvcaw1KufX7h3ldZn+/k4Nv4LbUCjzzNIOnQL1jgA/TDrsqNnzpY/bx/0M+4NS
	ib3Ld+IsxoKVy0chZf+Qjw3AViKTujQmNB4v2Yp+U3a3ww85QyFnfeYdQsenlbtxW4I0KFSyOjC
	g18V63cJnhg+u6MdbPVYNz7C+bT3IZq2w4iON2NF5l6rV0tOEbvswtOlA3ZciQYRHh42DkeLbKY
	pLX3ca5Rpi3DiujyxnObTwT6fpmDYxT2Ca8PAxKwlN78C0lSua8q1odWX9bsm47A/pR9kH2dZMs
	5w7g+xFVB2JjTR9vrHsgjhoBZqYk0EYqeLsv3walBoElu+5s7RlXMg+/Jjs=
X-Received: by 2002:a17:903:2343:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23c87470019mr251805915ad.1.1751927781855;
        Mon, 07 Jul 2025 15:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW1Bef0ceUwQpnhYjXdX6dtTGeppIizcEogBC6WZz0uiIFGUyIDjkxNhouugTUww4w3XZDJg==
X-Received: by 2002:a17:903:2343:b0:235:f45f:ed55 with SMTP id d9443c01a7336-23c87470019mr251805535ad.1.1751927781443;
        Mon, 07 Jul 2025 15:36:21 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee6358edsm9668064a12.58.2025.07.07.15.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:36:21 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <quic_sarishar@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250701105927.803342-1-quic_sarishar@quicinc.com>
References: <20250701105927.803342-1-quic_sarishar@quicinc.com>
Subject: Re: [PATCH ath-next v8 0/5] wifi: ath12k: add support to fill link
 statistics of multi-link station
Message-Id: <175192778075.314276.9132568715963228413.b4-ty@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 15:36:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDE1NiBTYWx0ZWRfX3Xcbv+EnDPcs
 serpsWmpb6nZ4dUz7karDoIXOH71qs0ZHf67KNhDtZbNl+WWA9umBtpf/1UbfyDGW0ElDLGpF/9
 3KUsMsnC7A65CEFV62Rn45RB37/tFP/cDLx0114Y7xp2VChKciy+83nNU8RGI/NIBMeFKQTK5Ii
 JX6ev+GUKNtNYfdhGZEfJDYq2M2SUB/JhoI6TN1bpj8dl9o3Ub3JNpO8nwsn9d9uy3Ttc+iXbR/
 kI9wVzL/h0TAVZEDPUgJ+pep66n2pwxX1uam1i+8L6JHj5hjWTXXrGVPX7t8QuCBEb2cRp5GYkM
 Kxt+eczq+QAzIjP3jkPLCg9iPrKBODwhLiJsXZXovppVhdU56qk09hs/2h6OLUWkp0lBcJazdkZ
 sveqQnnTaJnP/LSWY9SNLWieTJHs2fajIwyC2do62NnFMfHsQCpImSWuV3HwxZgWGbKP1QlR
X-Proofpoint-ORIG-GUID: OF6AIooDXXiCieV2rZuleN7uqntzgx7x
X-Proofpoint-GUID: OF6AIooDXXiCieV2rZuleN7uqntzgx7x
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686c4be7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=zQT3B7j2P7N7IL7r6JwA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_06,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=799 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070156
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_153624_475018_738FDE2E 
X-CRM114-Status: GOOD (  10.13  )
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


On Tue, 01 Jul 2025 16:29:22 +0530, Sarika Sharma wrote:
> Currently, station statistics are filled at deflink for both non-ML and
> multi-link(ML) station.
> 
> Hence, add support to fill station statistics for the corresponding
> link of station.
> 
> V8:
>  - Remove unnecessary initialization of bool is_ofdma.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath12k: fill link station statistics for MLO
      commit: ebebe66ec208d37e3368b91e2033907cb5140821
[2/5] wifi: ath12k: add link support for multi-link in arsta
      commit: 3b8aa249d0fce93590888a6ed3d22b458091ecb9
[3/5] wifi: ath12k: add EHT support for TX rate
      commit: ebde0514b4f4e78b5f9629179ca947d98b77da15
[4/5] wifi: ath12k: correctly update bw for ofdma packets
      commit: e0618fca1af294f2e52ec3545d76ee5d937c177e
[5/5] wifi: ath12k: fetch tx_retry and tx_failed from htt_ppdu_stats_user_cmpltn_common_tlv
      commit: a0b963e1da5bff03a43c87b96ae3c0ed78a11960

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


