Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E7E6BF1F
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 15:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTcY81yIclkYNJ1+nOOS1HT+sbXHp33WP4xB6dvakDw=; b=hB6gNNkfd8pWgvuv+jMNJ4rujY
	RT32V8IPA7ZRUsJPrI8mQ+uEHVRuYAK1r8Kd/XNxGvTyabCtMUxIOfQOZq7wFEZmqzqHZrwaSk5cH
	fsShfuzqh+hU02Hd+1sRVzs1MDUp07JmD+3JyYNg0Sby9fWq9cxXH3e3HmpHED44XYxHCGLvk5nFP
	AMPj4e3XNfe+i4Dfvuj5VBbGYSWQIIiVPE2YWduYpluOILVG99xQ1u45MOxzgoF+pgsK0q2xiau/8
	rkhrDfexQydzeHEsMxtWOx+sdTvsKy2SsP43o0vIIy5GHGTAFRyOmukxIQ2sbjsMvvLAXDkseY/+A
	nV/a2pOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDp-00000001cvL-3Mxe;
	Fri, 30 Jan 2026 15:15:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlqDn-00000001cst-0oji
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 15:15:44 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCVRxn1826460
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CTcY81yIclkYNJ1+nOOS1HT+sbXHp33WP4xB6dvakDw=; b=IN/hpPK2ioBj33UC
	1PJAhAKz5hr2lZYfPetDg513pWzuuIPHbBB1Y7y80TNVrKtj9SbObGLT2Kwogi16
	lbiaQ5aSkRAU0DufiIQPnAQrZEPTHmfLErv5dMxVIz4J5IySITx95/V51eZeyoA+
	0RldFPpA5LHIR2EsJKZDjd7DnSUWZpNK5OQesxj2imfR3P9d4LZL8zMJN5Dpzzaj
	BurKgRVlKNI+E9zfZZnv+4gi7rXs2rCbsBaDIZPmsXwM7ZNFwa6uzJQq7xrpGaeE
	WzDKtaQpkWh6ooHyyzRXHwMc1J35pnoUfY+gC5AKn7FwNP/NKJGy5g9qRWSbomcV
	+ufjEg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0nsmstmv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 15:15:42 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b75222e9easo8012088eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 07:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769786142; x=1770390942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTcY81yIclkYNJ1+nOOS1HT+sbXHp33WP4xB6dvakDw=;
        b=ZYd++sw6U94ja4lHGQ4fIh1m54DjGrd8OGTJ0b69xhWG5mEAHvh7PM7IqZfPXzff06
         a2OJ7wWQ187wqzqMLeNlXh0rwwrqzNKZvhNdzxA69fdTeW1aZ3rQW6dd16ENl7PHZmD0
         mTQVodhRHdD9QqM038WvLTt7QbIpMYVROxgyvLfAhzf6OJsDScw7g+KIEgodAE8DFom9
         KP6tD53kBE/M91kfjngBXmTl7JKbRSrRBRKCHo3oFktJvBa6cOtCcHfiMrAvrrtGFkNa
         5Aueb47q2iBuaV2Z84wAg8HMJYr2m/agkmCn+BI5Aqjti6hKZB+FqeikmS2gbriyHJWP
         jzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769786142; x=1770390942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTcY81yIclkYNJ1+nOOS1HT+sbXHp33WP4xB6dvakDw=;
        b=c1OFd09apouv6WJKJr8wHVjQZYAR6pdmHFCjS3s+8dyeRx7JaORd//5XnYW9eHFx4d
         kENfdvgWbFHVpdJyfQhD2JN5TQdbXytw7J1i261VOLzLUapdSpbV+y2NyFqdNj4ZID78
         AdDT2uCSrWLAQ0FB5syqYYguIKmLN1aRw5tgbRyg1QB4Uz1JJ18QcHCCV7V6grEMDf66
         G2IELVeWcoL1EZc6XHIU/enNisYVoNG8V94kHFh/kFDbarY02G93ctwN1qpPWfxr+W44
         AktNvS1b17ghrEXYtAZi+GIm2IKkT8WxnMV/GGHw/0N/DWyy83UjrKPn2i8YV5at0br2
         LK7Q==
X-Gm-Message-State: AOJu0YyzpOnRwx+1BnPY+/SlrEOTNRJKK36YOIvYWCn2d7i/IzJzxqGk
	dJtKle2a0AMFuqIUf+gO7jK/fpfV4X6DcFgE7HX0iTFEe1JDAmVFi19bBUUcCEIJ9XOHZSshwKz
	t7PNWH7T4Q+P1UwPlHvkgHSR9YlcOXHKFiEL/C3K3vRLcNROzJ+r5r1KvnZ/5Z/44
X-Gm-Gg: AZuq6aKdfDpBnWVhpwOwtbI86/lu7A586wH/zNfA+DOk9oi/ZuBGMpAU13FxT/69YLZ
	f1iLa9ccR3aXptQyuwMittgYyv287BpbHFDedZNXKgCeTen7vHl7+eZpYcDVI3b2iGBJoLg7Q2h
	KydP7x+hTcmlnXwOfb7IGdwhsdL5A5IYAFUj1wWM9oqCLvYJUpbWYQOs56bzy5nfnydUSShYW0+
	K0c5e15vcUPAlgFQesmmk4emophR3z7Ko5Xde43I6yjr8SOz2TZTkjK4NVAeFj2+nOLBI5qwcdU
	L4kA/SoEsdhbNgSyEBv5xLw7HE9NrzKqyGLKWeHahO0QrFu04DGG1ygyDka6YaSbXX6KwunPYgi
	18CUnJlFCbtH7ZHFAAWfFCLlPBGXbY1Eq0ZLXvi98OLt+0koZue3gKKBVq12pkaE8
X-Received: by 2002:a05:7022:e25:b0:119:e56b:957b with SMTP id a92af1059eb24-125c0f0dc62mr1667957c88.0.1769786141845;
        Fri, 30 Jan 2026 07:15:41 -0800 (PST)
X-Received: by 2002:a05:7022:e25:b0:119:e56b:957b with SMTP id a92af1059eb24-125c0f0dc62mr1667938c88.0.1769786141268;
        Fri, 30 Jan 2026 07:15:41 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d7f95asm10252849c88.7.2026.01.30.07.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 07:15:40 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260127033400.1721220-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: clear stale link mapping of
 ahvif->links_map
Message-Id: <176978614056.3951544.9534320708366481155.b4-ty@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 07:15:40 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEyNSBTYWx0ZWRfXwe61iJEzm3GX
 6PXb1wrrLPsc01VHbOzVvwavb0eixu3hR/idgwAc6MIJEic0l+d7eI0S96mH1mWwGPze6qDuxdS
 Jm/jLFuqxQaB+NXb6aMwbM+4jXhjci1EeuJfSMBC8YaUTYy+zczL4NHxbbdWLWfC0qhHMb8KsbY
 D1B7VgjaIvaaEOLZEG78yOQp36ZKWGB6UoO8oM6r8GfiiocJaSPP/mZaxX+xfPEBLj01S16QAMm
 6ySOCa42PAP7MvY6yXNovTOBSNLcAsNf2snvU67wIE7+jDhQ4g2aCviwz3+NmRAXcAuTitIDQDN
 baQ7tSjBHj9QahAyxiIQisiboXdLcVR115idvI6dW3xMumvNC6HCugys0CLobNWE118KwbPRwWY
 XTDNdOmO+qvdIIR/FgExiW+n6mF2OfAk8lcQsPwBmmvYsqueIrmHr8aHf7IZGgHUTaOR9AXlxJc
 tCscBen3K/ZX2AswzZw==
X-Proofpoint-GUID: 1NPf3ITLvS6B2vOKcOpXW7yk87kZUbWA
X-Proofpoint-ORIG-GUID: 1NPf3ITLvS6B2vOKcOpXW7yk87kZUbWA
X-Authority-Analysis: v=2.4 cv=HMbO14tv c=1 sm=1 tr=0 ts=697ccb1e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0KSZRMCv1EX8QH9XOcUA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_071543_239160_36F7D162 
X-CRM114-Status: UNSURE (   9.88  )
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


On Tue, 27 Jan 2026 09:04:00 +0530, Aaradhana Sahu wrote:
> When an arvif is initialized in non-AP STA mode but MLO connection
> preparation fails before the arvif is created
> (arvif->is_created remains false), the error path attempts to delete all
> links. However, link deletion only executes when arvif->is_created is true.
> As a result, ahvif retains a stale entry of arvif that is initialized but
> not created.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: clear stale link mapping of ahvif->links_map
      commit: 2c1ba9c2adf0fda96eaaebd8799268a7506a8fc9

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


