Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D9DCA101C
	for <ath12k@archiver.kernel.org>; Wed,  3 Sep 2025 21:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v75Fi62mxj8XNkVxvV6QLVkFyFtoZR6kYPM+nXYqV8w=; b=CMazOY6KpGeoWkzbOH3d0v+H9/
	lkiS3GKf+8F1MA0sZjk6ekzbCsUomOdU6WmkQFtVyT0kSY6lgZFY5VlewYUgXEJFfWGgGJk6XUKGk
	3juvhdviRL9Y/z/5Qw/jeHqYaDZsCRraD5fvQllEd2H075bkwgMC/+utKCpTdDpsArfjcohdq0kCA
	kVmcCpZokhsSdLjKtSMB9rDzp+F+40N+3V+ilzs6RPsslnxlD4lnbHdLQvtNw1LonY7d/3HN7/4zT
	4Ob+IcGNjYx9WRPCWGrqmZbh0o8d3MBx2HT0ovkOkMuSsOF5JuDYFS8nyeKd901wiwjmLSCLm9bbF
	L2SJKnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uturt-00000007dcS-4B2V;
	Wed, 03 Sep 2025 21:18:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utr3v-000000079ow-1G5V
	for ath12k@lists.infradead.org;
	Wed, 03 Sep 2025 17:14:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583Dwoej021252
	for <ath12k@lists.infradead.org>; Wed, 3 Sep 2025 17:14:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v75Fi62mxj8XNkVxvV6QLVkFyFtoZR6kYPM+nXYqV8w=; b=Od6szjhSznpqY1+n
	eNy5x0ccSdkjRujVv81Szew9tRda6eK2xn6UCfi93L6RmhKLXZe+fX9i4MPNTDLZ
	khOQWJkLPnnNsmhbegOweW0kYV8TASak7Yt8KPnjMIDjyUkPdfwYZUksNcK/L0tp
	WbMLnQsQZHSIAGZPNyxdRhoOcaUKcUwAeNy2SiAXsrqq3Kqzs9ecFwfeySKiqIN5
	FelYQagn5FSAt2zkgcT8RmtKZ7Ly67XgJDP7JQ5ZZlxFN+5w+L2pyXhdm3OWXAWR
	KATZaA3Uj7j7mZB9grx7zD2Fh7A0o+LkSPa6BSWqUjIWJBRMgmNIzDZIRrVaTd36
	4va8qw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0emr65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 03 Sep 2025 17:14:22 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47630f9aa7so34633a12.1
        for <ath12k@lists.infradead.org>; Wed, 03 Sep 2025 10:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756919662; x=1757524462;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v75Fi62mxj8XNkVxvV6QLVkFyFtoZR6kYPM+nXYqV8w=;
        b=IQu/gcTeTe5QRpiqumFxuz/bMQsWxdse8tsZMCEaaBE3W2Iliugq7LYgBhsruALSqP
         XlCmbPZgC+mK4Q75ttPs16x0exi5ycfwyfrfpyx6ycKqDNfXzbDuVJMW1hRHAJBGLka7
         izaucBr/HhP656848JWOI1lMMaxc/zkboxuJEZVFhT3SbitTF/nDrGTWzaDRIgRqtiv9
         hoOlVQw4Fah1nwLfQcEam/sHTKBBsBH3HtJwXAZwGDs/3V2a1ECqRYUhwUxFigiUUCnq
         /BeN6v3wYkP+lYWfPdRPIw11VhQ4mH+LW1EOtQIg7jWp4E9Mgai/wuAQKfYiWkVkRORy
         NuAw==
X-Gm-Message-State: AOJu0Yx+HTZ1aI7SDkhqqbJ7stFmntQygIjWDg39KWtpvRLg/GjA81wC
	B5bwfFYSov7n/iCu+qZkR9uHzvvnxVD+T7tFcrR7gmyBJfDpPa1jjk89kceyZqUYPf87FnUKRgt
	YV9HG9maPjPtejsvzftIee02wfaaqnthgb0dM6N0NbNL+VPymWb/YeaPRi++ZjsGDdz265RWo
X-Gm-Gg: ASbGncvY93XK9siD/8Fao6AaV9fUZHgLtVkg6Efef/EeZUXMx8Nb2x/GyEkOud2zdiJ
	C3Il3ZhQFMQgdqF/oKcufiYVBa1PFos7mwLMDUQZHetbExhFtkjRmr9vR5EIhXEV58XUcpK7EQ7
	waeVnxRfkzFIUgnRC673W7stvfXbE5OSRRWRozxJt73Cb2M7JSr07/bg952Htv0iJXKKerpqaH9
	5iw3dfdj7KD1rRgVB26UVirhhyEvoJq0a6cD7SY/wQ5hspj9gT6MsFv4cKo96cguEQM+1Q/vuee
	zMCEaC6Us6XL77CkS4j3p+zRpWuLD6O9JM3NgCwftd0f7LlpqvBC1Fv0301uA8Gj+mzT94K6fsc
	D
X-Received: by 2002:a05:6a20:78a6:b0:24a:c995:e145 with SMTP id adf61e73a8af0-24ac995f03bmr30765637.19.1756919661734;
        Wed, 03 Sep 2025 10:14:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCCvEqrtzK/dfNfpYnHQ2d0iihclOP4R05ltVmeesS7FMCdTLdkH6CFKMRA9lyoiGNrk4JTg==
X-Received: by 2002:a05:6a20:78a6:b0:24a:c995:e145 with SMTP id adf61e73a8af0-24ac995f03bmr30730637.19.1756919661224;
        Wed, 03 Sep 2025 10:14:21 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725f0c4008sm8977063b3a.35.2025.09.03.10.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 10:14:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
References: <20250828173553.3341351-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng 00/20] wifi: ath12k: ath12k file
 re-organization
Message-Id: <175691966048.1226519.16179210162872545412.b4-ty@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 10:14:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: k0MezeUEgdLQPcIZO57TiUrA4c0M6seq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX0d53ErRpQZFp
 hLBcUUz9AQ/a12ftYFO0ebgrzERkthkosWUi+WpL73Ji9Oo3R3nFowkJL5HTtSSx1cyYwwwdv01
 1drVHqRTWLKnyg6FuAGJslesaS7k+K6Q0UUhBLc0zfCjyUwtDxII60LcUyDK22jgkEJArhsylIj
 DvtHwHcFGAPaEd6h+eECaYHbq7q6Ljmxff60RQ5mF3QtDNNnl1FWiZcurBQSu7e5np+UbOp6htz
 DTrlEEK/WKgdrMs+NI67Ox957P0erwXzWCn3HGiXnYaKCQJNy8syny/rNDvkc9q0AUGfGUMujwT
 u4OxeS7aiI+ZUUCCnUfmZOEteEGBZgsBvaCyP4PRU4KmGQMV8nIZWZmxwvrEKqgqkxOBpEih777
 +Wa5qTEG
X-Proofpoint-ORIG-GUID: k0MezeUEgdLQPcIZO57TiUrA4c0M6seq
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b8776e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ctgflo7pkZbJDB4sY20A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_101423_359289_69370A33 
X-CRM114-Status: GOOD (  11.86  )
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


On Thu, 28 Aug 2025 23:05:33 +0530, Ripan Deuri wrote:
> This patch series continues the modularization work described in the
> https://lore.kernel.org/linux-wireless/20250812-ath12k-mod-v1-0-8c9b0eb9335d@quicinc.com
> ("wifi: ath12k: Ath12k modularization changes") series, which established
> the foundation for the Next Generation (NG) ath12k driver framework.
> That series introduced the foundational split of the original ath12k.ko
> into two distinct modules: a common module (ath12k.ko) and an architecture-
> specific module (ath12k_wifi7.ko) for Wi-Fi 7 devices as depicted below.
> 
> [...]

Applied, thanks!

[01/20] wifi: ath12k: Move hal_tx and hal_rx to wifi7 directory
        commit: dc722ea9ee13369b1d4687160206e6bde2e8c2e2
[02/20] wifi: ath12k: Move hal_tx.h file to wifi7 directory
        commit: 020225bbf4fb2fb23553ac9c65c8f50bb4d2fe74
[03/20] wifi: ath12k: Move hal_rx.h file to wifi7 directory
        commit: 4f57d71862a7edef67de6c2072127dc1c8960a24
[04/20] wifi: ath12k: Move HAL Rx wrapper APIs to dp_rx.h
        commit: 2ec00a7747cb78b0c310ba1c8bc9893e53101569
[05/20] wifi: ath12k: Move Rx error related functions to wifi7 directory
        commit: 1a6a4b6c9f0ea0740c86dda8b981b6d818433fe0
[06/20] wifi: ath12k: Move hal_desc.h file to wifi7 directory
        commit: 87a230ec2bfa15506b885e7ab958bf45b0036e8d
[07/20] wifi: ath12k: Move rx_desc.h file to wifi7 directory
        commit: 8658abc7139fc72d94959335becbabcd2b3c95a3
[08/20] wifi: ath12k: Move rxdma ring config functions to wifi7 directory
        commit: 8dc72a6f603e81050ebb3d8b4b2fc5fde0d9dd93
[09/20] wifi: ath12k: Move rx error and defrag functions to wifi7 directory
        commit: 6b4954d3f0000cc687f263a151ec2c7ad38e00a8
[10/20] wifi: ath12k: Move regular msdu processing functions to wifi7 directory
        commit: a7cfbb18d411b186ff67f62215e53e125ccc93d6
[11/20] wifi: ath12k: Move srng processing to wifi7 directory
        commit: 5d2df2aa84303a187b82ca048ae28709bef85f77
[12/20] wifi: ath12k: Separate arch specific part of RX APIs
        commit: eb2120ae6ab5790527f3b3066410543c1b7a5ab4
[13/20] wifi: ath12k: Move arch specific REO functions to wifi7 directory
        commit: 6c7ceff2bed9d69007d23883f12a1406e149a060
[14/20] wifi: ath12k: Move arch specific rx tid and related functions to wifi7 directory
        commit: 52c555680bae89a5169810f1f12a06241c93ecb7
[15/20] wifi: ath12k: Move arch specific tx APIs to wifi7 directory
        commit: 8527d81ee622f509df11e4444c7d0901ac542174
[16/20] wifi: ath12k: Move ath12k_dp_tx and related APIs to wifi7 directory
        commit: a45d0e81b2429c26db6b1ee0d43ff62b12d41d1f
[17/20] wifi: ath12k: Move HTT code in dp.h to newly introduced files
        commit: d3ade00eb6d27dda5ba0026f5602f03b99df5a96
[18/20] wifi: ath12k: Move HTT Rx specific code to newly introduced files
        commit: 71a3f92c512e1605a2ffdae94e4d4e3a6a63b90f
[19/20] wifi: ath12k: Move HTT Tx specific code to newly introduced files
        commit: 611297ee9faf6a28b1d553c41c4677052629cf6c
[20/20] wifi: ath12k: Move HTT specific code from dp.c to newly introduced files
        commit: d637c58a29475d646f8decfbbc1d27fae999a449

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


