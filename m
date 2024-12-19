Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23486E77184
	for <ath12k@archiver.kernel.org>; Thu, 19 Dec 2024 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5haKGbPmr+wCNSOKC7HRHsCVFR5gFuEaq/dhQ+oDlGk=; b=WlBjp2BdO310dL/j0uZfg6s3xK
	hfDeaiikJVL1Pzdd3hzr/RQ3n7eq6dIElmoLe8RhHbi/96pulWPCNOklSp/iEMjTKVNm9hiOLF51H
	By9OrK+d+vgpMW/+LpV3xb3iF3M3MNhWrrXMPaXJne8DYvq+JjsAugPJAX2hkBXtmbDibDRJ/4UpR
	FQ6SgbUzWbd346pO9DOaYA27GFEuNMT4F0nSx/ys1nSypubYne7U/AB00TGdXJYePyVZ1baC4DTaz
	dVrncExJoR2T6VVJr4kRKr5isnLoJ+SNY/deh3Wruh8qmCBbfNU7QclvVzxPJz28+BsKrp/NWDTJ5
	c40KJvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKvi-00000002gsK-3nSv
	for ath12k@archiver.kernel.org;
	Thu, 19 Dec 2024 18:07:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKjg-00000002e6f-0Grr
	for ath12k@lists.infradead.org;
	Thu, 19 Dec 2024 17:54:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJHL2CB015489
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5haKGbPmr+wCNSOKC7HRHsCVFR5gFuEaq/dhQ+oDlGk=; b=LN3a/eoSOGQPvBQe
	wj7rGLFefDEGfS1ZBwyNf1cHqxA9mvdCYxdnzvtR7QPrkXXxJuW5/p+tNn0nuATH
	CDr1CgpjP/9SLGJms3az9sY6VXrWhVxGKFEpr1gCq0Uvk0IZNQFCac2vnk9M1vGu
	CCXLS1JemzUolgpFi4R39rCHZvKaGxyoyLFy806czWXB+248o1GndaR+h9BrWgwR
	fX0caxI0UTlVsVm1SLWwyIMrzKUnHY07rphd7aSASaw4zVvtLPlha+LBdKsD+qGo
	G5pHGu/dC6hVoFC5CX3j3l7cKR9iDG66cns4FTR02StphEFU19TJOo1fLV6Um+Zd
	GJCGOA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43mqt802hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 17:54:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso972058a91.0
        for <ath12k@lists.infradead.org>; Thu, 19 Dec 2024 09:54:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734630893; x=1735235693;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5haKGbPmr+wCNSOKC7HRHsCVFR5gFuEaq/dhQ+oDlGk=;
        b=HPO2QJUBVQG1wtnmrxzW4hNA6JXTMGmEurUx9CH+Qhl7occ8pZriBIa3OywKJqZR9I
         T7IBUYFIBMOZKYjdtCs1bARNZzAVvTj83+26KaIertnBMbIWZzQPGe/nXt8REPqYePiT
         6wqctfFNrroQo3dsakE2P+GwIvtVhfkT/Y4jPhZ2q4Uxe5x0dQQimwEtA8gIOFCjY8w2
         3tlsOf6liOBGs6xVGlA+QVJtwspwoZzqRawqCxc0e7XSCkqvXTTzMuJy/j2eQwhtH+I3
         CXVAT129JQ524a8+rmRnRC6ffBihfGlymeWLmQImQ8HtiveweUtkZY5H5YgYZRJU9C0h
         zJuQ==
X-Gm-Message-State: AOJu0YyKswUgJkH7hSMWUkzY3PeNXAqGGTpQoWg/RJFxAvUEE28wj6/x
	DuiQk58EtO5+rvzfYzjQw/Vo2ZbXNtXn60iY8B0nfWw96dc921YrG7NHfXC/mZkAaYX297lOozx
	FGVtwYdq0AGmVQnEiTiCbVTgTxDU1hQGIG7OQBJ8P1GY/EsEbc/izvCsTONx8YfhL5EE9
X-Gm-Gg: ASbGncvZO3VlXfpKaFsQ8d8ATJ+rnktkaCfz2+LCq14bA62jIeZnSKfWJny6H7GDGVY
	udeYxYCc/EwJdYpAhUZ16NT3CFasGQandPuQ5Vmq/GudsYhDC6ARlTB+8K5n3Nl2nXIW5vcKRmn
	0JnlBa1BhWjV2YVIHhV0G8pEmw22xQ8TfQVvNOAPZZUUw877p3Fi92Num/TK5v9XRySl8VylYax
	fax72ppeNd96TlMIFeEiG8oFIh/Sqc0W0t5M3C+H7QVn0zQHbNyHCQXJ50p0qmJg2dYyQx+kwOi
	XbSnKeXMRZjt8w94eA==
X-Received: by 2002:a17:90b:2d4f:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f45216dac7mr340836a91.27.1734630893024;
        Thu, 19 Dec 2024 09:54:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGobhZikNK/hsQ8IV2fGUYfGV/HS6RgpNhx3v5W0we8LL/jn4YuAmzuIykLxPLhyu+dX53ItA==
X-Received: by 2002:a17:90b:2d4f:b0:2ea:2a8d:dd2a with SMTP id 98e67ed59e1d1-2f45216dac7mr340805a91.27.1734630892611;
        Thu, 19 Dec 2024 09:54:52 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26fdfdsm3630628a91.52.2024.12.19.09.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:54:52 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, P Praneesh <quic_ppranees@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241217095058.2725755-1-quic_ppranees@quicinc.com>
References: <20241217095058.2725755-1-quic_ppranees@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: Add support for parsing 64-bit TLVs
Message-Id: <173463089190.2609009.942876248648067972.b4-ty@oss.qualcomm.com>
Date: Thu, 19 Dec 2024 09:54:51 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: uTgjf-xu5k3_I4SnJgJfJBXmUH7uTf9O
X-Proofpoint-GUID: uTgjf-xu5k3_I4SnJgJfJBXmUH7uTf9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=900
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_095456_113130_BF73F1A5 
X-CRM114-Status: GOOD (  10.51  )
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


On Tue, 17 Dec 2024 15:20:58 +0530, P Praneesh wrote:
> There is mismatch between the format of monitor destination TLVs received
> and the expected format by the current implementation. The received TLVs
> are in 64-bit format, while the implementation is designed to handle
> 32-bit TLVs. This leads to incorrect parsing. Fix it by adding support
> for parsing 64-bit TLVs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support for parsing 64-bit TLVs
      commit: be8d47f181fd4f341b8beee1ca11a96d296d2df2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


