Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30997C282EC
	for <ath12k@archiver.kernel.org>; Mon, 17 Mar 2025 23:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/sfkIrXSkNuWt4PPb8dMXmpEaWbqBqVV115tehWPoU=; b=tnoo8HhOkk//yZDn7H3CJCRCmx
	710NuMBVpojdxoRmQEpvSPhveVO9HwHthCn9f086ShdVtm7GRp7SnDjqwfo6O6GUlWyykLMS8JebS
	CJncJduhb3jYJvoMiamfOFodD87xeCMzXdsZTUdTgL8k2E9eBS4zfSCRqxuMrjNZXhuiq4qzSyMBA
	UpokcZY6O+r9HXpt0voAAHj8tcVl3uEE6dQ/FGBVS4HOL8OCKW8mCfxEaRsFXq6qQpomAPedsaglc
	W1wBuIYW1zw3+U6YxV63x9ckr+1Y9ebaq+zqV7f5u6jtguB2pPG5tClyZpmq8bJ5o/60FEqkLGHxy
	7eseAZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKAR-00000004CPp-3RdK
	for ath12k@archiver.kernel.org;
	Mon, 17 Mar 2025 23:46:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuKAO-00000004CPS-48a4
	for ath12k@lists.infradead.org;
	Mon, 17 Mar 2025 23:46:46 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HKGE5r004742
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/sfkIrXSkNuWt4PPb8dMXmpEaWbqBqVV115tehWPoU=; b=CMoS2PiTJpapGJv8
	5oD0Y3Pqx4ee4ArBsmhk+hlPvVQUZPz4HgQq6SG26LY22Ci6rt5Xy3lYzThTRy24
	B+D7w3IW4fZ6RqwiCfiMvzXYccpi2TlEuLcgAiTui+Stltk38ovtuuglnBSqdkFz
	GXVWQJxga5DYPHMbsjsziN/7zLK6O+F7XYE+yKAzHxDzrC0nnGZn/qktHVAy785u
	5MLHJ3kbEWLDxYDq9MiV+2DGk8GBoLzt/6lh9hvYLQkf++sLMqbQtd4+M2nfSL3R
	1GZ2SqFwlucsmzFV1XSjmD9JR8iKOQnMDpgxVsuMSoOjkMJ2O0jX1yZlcnkT0hj2
	nQq2FQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbrcry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 23:46:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223fd6e9408so75652825ad.1
        for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 16:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742255202; x=1742860002;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/sfkIrXSkNuWt4PPb8dMXmpEaWbqBqVV115tehWPoU=;
        b=QUH6IyuZQDa9RrwYI5MD7ZBhkRAsGsbPdPIfOnUBaG9DYiX8s4WtU0z4oYvUfmctb4
         a9L7Ob7/lAhpmrnFah0EYZkqp42zcgG6eOmnKONBxRqe8u4JpGGou+ylMwhWeWfkwfEx
         351137rRkHcZP4et7CPyL+jvrvEBmQn1efFll+0F7RQQxG4wXgtziaznF/54P6F+NKVp
         lhYXrGfFXEHS16RuW9bSPd3VoFIVQLGBF2sQwihidTLxb/B00wb+ba/RbBGX9Our8Tg2
         v6yczSs4TmIjmS6s2tpwNMat+TmNDFomtmzfSckWEZD/5wTE+4Fh+oc3P2EzfNanuVGA
         N+Gg==
X-Gm-Message-State: AOJu0YypFvQvygqXiJzOdP0WDlnU+d6ywg1Z0lACUAPMufQAhgRwSMmc
	ibYjkFBGInABeV+PgK9X1Og19oNtXv67TliXc3YI16DYB9YDXZBuQ2e29DPBOLhdwYVn/07YxPW
	ENDquf5tbKbLix/ud1T8ejpWx8J4GfbX8BqE3reTSKaA6wkAH57mPTyNJJBPhM91N9kB7
X-Gm-Gg: ASbGnct4vUjYXJRCNT/GPrVwPv5odtFBgAPYC4Xp9/Aoyfxjlgxh2ylFmVTcoDkSS3g
	qCmGfoWjPnUg2NIFdTg+YodsrGtNI4KskYN+jhVxg5qXnshnP3weNRywNlN5IHtWW3yMm6xFuHu
	szr4N1IPwdQv6+AmrBCzLmL6ux6Pyi8cFvRnZxpZp57qrU3SoTIqxKQmhUbbEqk8hp0jvk53i85
	EcPK13Ho0cFCMJERNJ/ElHFiUPD+Q1wljdzw14c0wL+6VXrXibuPXSEy6YINAqdzSUjw106Ah0d
	MSlz36TsWCDShHdS1Fw2HtNgZ71RxTd3d8SoA8rpHVYMuyDIyQ1I
X-Received: by 2002:a17:903:2ac6:b0:223:3eed:f680 with SMTP id d9443c01a7336-2262cc2da6bmr16839445ad.18.1742255202416;
        Mon, 17 Mar 2025 16:46:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6Aer9oh/tCgmZvJLZGc6i6PHPS5PssF48VkhJJDsuvir/xyz8UgsTQbzuy40q5rRL6kzIgA==
X-Received: by 2002:a17:903:2ac6:b0:223:3eed:f680 with SMTP id d9443c01a7336-2262cc2da6bmr16839195ad.18.1742255201988;
        Mon, 17 Mar 2025 16:46:41 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116b1103sm8228773b3a.167.2025.03.17.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 16:46:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250314185605.68454-1-muna.sinada@oss.qualcomm.com>
References: <20250314185605.68454-1-muna.sinada@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: remove open parenthesis
Message-Id: <174225520132.3294327.1520236017702995285.b4-ty@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 16:46:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: J0sDQ5oI48PnPE6aalQi2GqcJn2FQlqP
X-Proofpoint-GUID: J0sDQ5oI48PnPE6aalQi2GqcJn2FQlqP
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d8b463 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_10,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=726 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_164645_177531_D3FA3367 
X-CRM114-Status: UNSURE (   7.40  )
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


On Fri, 14 Mar 2025 11:56:05 -0700, Muna Sinada wrote:
> PMF debug log has an open parenthesis that is not needed.
> 
> Remove open parenthesis.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove open parenthesis
      commit: 47c91531edd2a552a8131414e4bdb0654277ad6a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


