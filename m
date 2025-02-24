Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57543C021BB
	for <ath12k@archiver.kernel.org>; Mon, 24 Feb 2025 16:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KihX8fWcq5dMXnYeD5x2k3Y6zz16EVIuv0fXLuyFB0A=; b=WqdcK2aRvSjwXlWpOSg9uLRQ1X
	hGbGLTZIobpmtIeq5CsYkkf9m9FlYzrkhUWLvfQgot4QPxeZf5no/T9RdwY/+oXx9OnUbVTV+j2ml
	0DBPiYXPU7VBdce0AklCHyfIY7vuspGNFQ+Gszcy/rIsLWe64xJuVDkp71rWrV6zWuDBMRNDGZ2iF
	YUKFVitJD8p4i4eSmwrFlHg1TALN2h0fm3lOvf8dxbunbEgmelLFx4m4yCfhHzWX27BVnnR7QjzKc
	Rg3YY+A0B4eVIlgKs7afjKqtgDiD9MV8KsHjdo5WuawApiXnox8EtL425yEgbjwQr8xKS32y9ER5y
	5EQ2zRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmawA-0000000EOlZ-0S5E
	for ath12k@archiver.kernel.org;
	Mon, 24 Feb 2025 16:04:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmaw7-0000000EOl4-1oMy
	for ath12k@lists.infradead.org;
	Mon, 24 Feb 2025 16:04:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O9sZtn013579
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 16:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KihX8fWcq5dMXnYeD5x2k3Y6zz16EVIuv0fXLuyFB0A=; b=mYhjsrvx5HCPARus
	nU4McE4ETAtX0SJ+p3+xZ+J1CUUb6YCNBR8/wtsKZIXPtbq/CVWLMXr9pPDvSm2L
	FaHBO5pjjb9EBdOxYV/kpdm4lcm0618VDfFqVtegh3fVhtLgJ+oFpMDVD8k9of0r
	Rk6yEa1BP7/rGWLFmHHUR8CgEdjxWMIoAQpOObaI4K3seFzjkMl1JmuYy0trDAmn
	qtdcgjICJ4Khb34w6tvBabncPV7O+oioBwZZqmHhOeK4f8PwHGDnwQraap/9XuwW
	e833FqwEsUJSXtoS+NndNRisONqBkFppDVxkcECQfWlNXdZqSG5YpKYKJJyTEvfS
	+p2Qeg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y3xndyw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 16:04:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e65aca0e5cso101240566d6.0
        for <ath12k@lists.infradead.org>; Mon, 24 Feb 2025 08:04:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413041; x=1741017841;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KihX8fWcq5dMXnYeD5x2k3Y6zz16EVIuv0fXLuyFB0A=;
        b=rXgCA3e8TQEUfPOgggejn+v54dX5W7OHCvaDUt+PhyYbJatMg3jupqI+A9E5R9gy1t
         9sEXHm/1AizQBfxD6how7sb5e16wkWwRCKHszM4doGbqjGTmI2X1nywrd3VqFF4Y7awH
         MOouwasudd4TdFZZ5veWs9jov+rG7L8MvP2RhtUxkX+6MzDa2eT8Zx7W97PV0lseis6r
         0fQTFC0w4tvu/ifHFLiD27oz00My0RM3Lvq3AvmepsZa6BhpFMTU70lsWWklp4OYwT67
         ehkSacf4v1G/sNwApKgNpLfMVATvoFIabOB9HGRZ0xiYfUsdeNQTNWTD9UM6ebn4cOiq
         kbRg==
X-Gm-Message-State: AOJu0YzvPvImSqc4s5T7Cb83kpDzjEAeYKoJs+gwNSEOK+7f4mpB4d67
	mjRlGrtAvxPmDYztL3z8loaJhDH+VeppEyEzOgdi/+MlVgzj8x8dLOzpitmJY9Ew7vzKZQ/qIsK
	o/XeCnjNSs7lEQqOedg51m1ocUN/H1weI5AAKWzVXkkTO1I5IfjyuGlgvjWQu
X-Gm-Gg: ASbGncvsxi45Gl0qfNnNcrlIhoQrE0Iha8pp5M1CDTeNbvtzek5SyosaXrWfdPayLB8
	xuw9UK6SO/wJsPg96Cmn7cz07UvbapsCIPjCq/lyQwuhayzNmWJFNmylQe+6oMhLovBqVzZ9N3w
	CrMLoEq/BkSRyR3bijRZIBqqwbOvDxO0yVEElm822WUX60G+1Hc2bZnHzI5e+tmrrK+b/02JSKw
	PxaiRa5mr+pR4WJsis5A3oXGl0j5vtLuKjjn69Ju+3YcF2ocNfiehhzl9KED7glRXVBawoAVzNo
	BXxX4/whG6doQfyZXv+wJGqofyV52ZDywv8fFp/HbiMQL9Y1/Bav
X-Received: by 2002:a05:6a00:228b:b0:726:a820:921d with SMTP id d2e1a72fcca58-73425cecdfdmr26648081b3a.10.1740413030483;
        Mon, 24 Feb 2025 08:03:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAQcuYU29yB2OA7EOTXyr62KvF4Bwf4grfQff9Ffr4ql6Y66zQ/N2fX5qaEmA175P/28JFdA==
X-Received: by 2002:a05:6a00:228b:b0:726:a820:921d with SMTP id d2e1a72fcca58-73425cecdfdmr26648038b3a.10.1740413030080;
        Mon, 24 Feb 2025 08:03:50 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7328371e36esm14470744b3a.61.2025.02.24.08.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 08:03:49 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250221041250.769491-1-quic_rdevanat@quicinc.com>
References: <20250221041250.769491-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Add NULL check to validate tpc_stats
Message-Id: <174041302955.2901106.8080221910773071155.b4-ty@oss.qualcomm.com>
Date: Mon, 24 Feb 2025 08:03:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: bPVVG0u-8TP3HvV6NQX-FfXLLhKlr91T
X-Proofpoint-GUID: bPVVG0u-8TP3HvV6NQX-FfXLLhKlr91T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_08,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=867 bulkscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_080403_598847_0FBCC559 
X-CRM114-Status: GOOD (  14.98  )
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


On Fri, 21 Feb 2025 09:42:50 +0530, Roopni Devanathan wrote:
> While processing TPC stats received from firmware, there are chances that
> the tpc_stats might not be filled and the data is not available. This can
> happen under two scenarios. First, when firmware sends a non-zero event
> count before event count 0. When this happens, tpc_stats will be checked
> for data before memory allocation and the tpc_stats will be unavailable.
> Second, when memory allocation failed when event count received is 0 and
> the firmware still sends a non-zero event. When this happens, memory will
> not be allocated for tpc_stats though event count is 0, so when non-zero
> event count is received, tpc_stats will be empty. There are checks to
> validate if tpc_stats variable is filled that are used in two subsequent
> places, but these are placed after tpc_stats is dereference without
> checking if it is NULL or has valid data.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add NULL check to validate tpc_stats
      commit: e180a01bf2c4a67db13d70d2d91410a8c6f74be3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


