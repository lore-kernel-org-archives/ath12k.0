Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF73CDB47C
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 09:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARBBHP/lX/obi2F3XxFDjHxjHM9YV/X3cKLW3oYFxOE=; b=SA79S0rI/j+HkUwTL+7CeXG+h8
	zz2gsNTA8Yl/K9tGgYtmtinHHXckTT2sD9nCuG8TrPeLblKmEK0KU7BJla0WUmmINwZxjbceOIm9X
	OHawjJ/4Ym3K7Lrvr9eSagwdTUxW7XXndZmFYBINvxYSZfmpPLVZ3DGDiTRAAkS1IbHE13huMuiCZ
	8cqDMTRfpAQtYNL2olLeMEszpJEDMo0tFnkQOTE1bsBuZ1yNrdbEbpF698ZakGEUpndRW5T+m66tb
	i/TV3hPSJCcgzXRwqfv55s5n6qENcZqmR6huCZTTdYucrxT3heegTqLtq7Px9cjHukY7T8/notAA+
	B7pTfeew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK25-00000007WPC-30OP;
	Wed, 24 Jun 2026 09:36:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK23-00000007WOo-3JfI
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 09:36:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tqjs1972117
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ARBBHP/lX/obi2F3XxFDjHxjHM9YV/X3cKLW3oYFxOE=; b=GPzJELee/BlsJyCY
	W+Z2ZkGUHhWEcYGWxaIrzyh7XGqGV7/rrjvFMeFIjPv7YOR6uEKnDcn4LwQ0+qgr
	y323jo8TEfkavJG40siMgQET7MtCsjsJLxow/MP80rBZsacOClh/gyThsBNjNyDO
	xKrH5O5i17at37gr+hVn4rcWC2hyzRn7L/sVec4PPZ1qqfTkFESMI94I40x0RGmO
	5I/0tk1s4+X6O0gRkwYvKYA79ogQlagAeXUFG/78aRJB7uwHmMHQlsXhIW4T6pfN
	Adm3WmImHYeSVGoS0nyIIm47x2slm5ffQdqkPxrQKb5Y4Nknhz11YPN+pGKJiDbs
	n55uQQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evad02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:36:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37d125687b6so1192776a91.1
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782293790; x=1782898590; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ARBBHP/lX/obi2F3XxFDjHxjHM9YV/X3cKLW3oYFxOE=;
        b=fagikmllZ6J3FTWpZyUnfz7Los3HvyRIwUEUICWaBmD3Ind3tY9ZVPJoEypkcZ49K+
         XK/Yn1Ny3xi62/qDyS9GxQFQVKYKhc7TuSNw5JnHXtp961pIyPvoWTUu+jkutPiUzgYm
         3mVOH0KwpPc5+18wTs3uuU4JJMZDRHJlUwPQKn1e35zmXw4dSYf2VMcAWz6BdZN7m4Vg
         t+3k9j86y27XI/MVEaAPW1IhjJwzfdDY/L1lB055x/9e2x1uu4Gt4A+CvnMkTo6tWCUR
         nk/tB4qc35nwtr9jNCUyLsXu097pZZp7hrbzE68FbsjvX24VqADKglhfSeJhx4Z/nSTz
         RqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782293790; x=1782898590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARBBHP/lX/obi2F3XxFDjHxjHM9YV/X3cKLW3oYFxOE=;
        b=kv0MbvPnfkX4nei7dhIWKwr3cQT9cndzkXLvOcYzEoDylbZNaYckINauw13WvXRsu4
         QwJCrUys8QCLG1MjNH659UStj73DWQlQhVWX5m8bN8k0UM+MA36NqTOHBXbkmtkgyV1i
         /NMC4jyt+QU6kegQp13onKHOo7vJXUljV+yf2jCpYJ39zAFbZ6a9DGo4cK0GO/PCJ6W3
         O1twIXK6/FQqSUy8MclIF0qPBOblBHsfoRsfIAC4cWtMpOPlBHdS4M6P04gzUgz+NlWg
         f+O/rz5tReyEIRdqzVtqKY29uWqkcnKjpDarPbEOfIJKWKw1xfP4peJCJQRb+mBJDuzW
         NUyw==
X-Forwarded-Encrypted: i=1; AHgh+Rpx6s+oGZ5gHjonrrOHKftrNsEM+X1m6uOHWWR2/hwCaUWLQx4bD2U7DTkPMtTYfli0sKrIp8U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwL/OqowyWhqKEF8M6bR1eCzodGZ29WvPicYDScjUKGz9yjyoY9
	XDR2JfAK0pcwzLWGBA/iSXtv3zxJBFKIpq7mRYfGqddqtZS4BYIBF7V7AbxQJToDm6rRBp/wxRJ
	Wihlrw2ND6xmgsp4y0hof+Vg8SfoSnGPPC43wuPGdhA7tf3/E/iEMXZlD/ISHQc1L
X-Gm-Gg: AfdE7cmF744LGTaBNO6mKmg6O5w7s80KnmiMi3PIRmQPeYG2tTSdbQ8kk7fotq79Q/g
	j0RM95yMCacWnYjl3nui/NbzIjF1vzcmBgILPrNuImj/mewyKqRfrPz6XcL/A9ImZrxiehyDb++
	WEm+0IP+ytsyuNAlB3G6RXxmq92Th/4n6AqWnvxNwEsm6QRRjD9NVGJZne0P3ayqMmYQPI0s3DN
	oAQeOKmQawaJc8mzokQnEIiNl1A9lmwXen7U81BztWma3ByEYz0wzRtnhU3vM3meTM89SZmKtaZ
	1S4gH0efwdIuA1FO3I6dOyxIO5Zhs/RXJlWoYJiQmcPTNxLaIvQ6tPIroVCnjmfcBqJyzSxNL/x
	qqa5gjKlQnf3Tbjm7TZFkrFewZJIVMXIR8+U7y4CojHuC7Sve+iAT8/BFCxUQy8G9suKAhhtkMY
	Rhgl6k49DN
X-Received: by 2002:a17:90b:5405:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-37dd0d0d8d1mr7786299a91.3.1782293790182;
        Wed, 24 Jun 2026 02:36:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5405:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-37dd0d0d8d1mr7786272a91.3.1782293789746;
        Wed, 24 Jun 2026 02:36:29 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3ba11c0sm1963173a91.14.2026.06.24.02.36.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 02:36:29 -0700 (PDT)
Message-ID: <09a358fa-939d-4c1d-ab70-8d6e9fe7b18b@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:36:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix inconsistencies in struct
 qmi_elem_info initializers
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-qmi-inconsistencies-v1-1-0fc17f2b8338@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3OSBTYWx0ZWRfX2ShePBKhzIPi
 XBq8oCT5rxSbnKzitX2UfVMTy0Cw4Fv2dXCLDSTYk/NgBDMAmYNoRo7m38BU+AdSIpmTsi4z58E
 hyyvUwdnbOn8+KMyswANaI9ecS6grz0Zf/MFq1dRGZPaww4hpENzMZiLi0gecpOurB1561YHytQ
 D7ahIIG0wuUrJGlASUMfawbtTGW0ieqxfoOz8QgWWmt/fBNrJqZGvJWQmsYQxjIm/+P2TBT4hcT
 gi3/DK0236PYEL4gWh9GN3h/WeW42p8vNFF3NXB53YqGNgKvLCbDw0lSq8OBuw2stFD9m//PT7j
 0sDET+SOQmAScgTpxYigWKa+twlckGWxX/kTEWVmak9mJIq29OEbZVO1WuF+cAylzD/VXFaDb/L
 EgM3Z3phUojMLCThCFw4V7k2n2fBU43qx+JbEn0mZFzMB64GYaksY3BjaRVRhFGnPDGQqYNBQKW
 oh6Tr5lPzcfnglqKoYQ==
X-Proofpoint-ORIG-GUID: 6Oss2IgtleD0L6h4MutaDbdQOEX8KlwM
X-Proofpoint-GUID: 6Oss2IgtleD0L6h4MutaDbdQOEX8KlwM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3OSBTYWx0ZWRfX/w3M6IUcwoQn
 JItFR7cIp6+cM+DICbL6WQyYM2nI5PDG89lJGFe435FvcWuh3agiGtHz2/KHngP0AA5dI6hGMEX
 QrXpzflge+41TamP+mUXa+cZMvq4+Ew=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3ba51e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZoZKXFMULng3zEwbkoQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_023631_845496_E7BE736F 
X-CRM114-Status: UNSURE (   9.10  )
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



On 6/23/2026 12:13 PM, Raj Kumar Bhagat wrote:
> Currently, the struct qmi_elem_info initializers in qmi.c are inconsistent
> in how they align the assignments, with tabs being used in the majority of
> places but spaces being used in some places. In those places replace the
> spaces with tabs for consistency.
> 
> Also fix incorrect and missing terminating records in the following
> qmi_elem_info initializers:
> - qmi_wlanfw_shadow_reg_cfg_s_v01_ei[]
> - qmi_wlanfw_mem_ready_ind_msg_v01_ei[]
> - qmi_wlanfw_fw_ready_ind_msg_v01_ei[]
> 
> Tested-on: Compile tested only.
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

