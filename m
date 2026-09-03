Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1F0C79F80
	for <ath12k@archiver.kernel.org>; Thu,  3 Sep 2026 19:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hN1ITePLMNWokGUQxGGCZDTGUrnjtyu3fs7u8SRA+B8=; b=Qz3VWnKQcZZXbLLpxVM33nT5Zy
	/6wuPd0vdyrBrfZX3/lWXmrH4YiPFZo49AzTkPUq8bE6gtOfS8ztM2Fd0wFQpw663JznS7shzJ/RI
	XLByCmpq5/r9vIvvKRapc0Pxgun9lCjXDBK5+fVn9LaxuoD4TBPiJtHWX6vWKVMfWQGuvG8yPIg5V
	ZmSizFXYnTUGpzJJoJwlpfMQazYG+7mfCW36kGKOXU4g6WmHxr+GRqiU9Zoz1JtYIvZ/etKrUmg80
	NT0yssTg3aRKRSEDRJlnV9FeQ/qGqgOYQUp7FtAvUTkJw2OBgS6B+AbRd1Re09z8yYUPCO0H9+1CB
	LALt+7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci5-00000000QPZ-11s1;
	Thu, 03 Sep 2026 19:02:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ci2-00000000QMh-3MYN
	for ath12k@lists.infradead.org;
	Thu, 03 Sep 2026 19:02:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683G3LUt3959299
	for <ath12k@lists.infradead.org>; Thu, 3 Sep 2026 19:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hN1ITePLMNWokGUQxGGCZDTGUrnjtyu3fs7u8SRA+B8=; b=nKAxzsFtVvxkZqtc
	kFEwGHBRTHfZCBSNdmx3xiG4PdHVX0fPoYLQw5zT80Q6HyQl6zELLJclITET6oiM
	FtcC9A/xPgppNI2rVo5O5uCIfWdLaQCDrwb3c0oyt+cOhcwGhhSyNPYb3syGW0CW
	Hxua2SWrIPL4ZliIYmMfg4bDEvGTo6kVO0roDzEJRIE5Wo9iEgasf6VmS4Y3/gP2
	3HNCT6CG8Ir+9Hf7dwS/QSRWUoecw3SkwaAC2TyHJ8mEue+ZbiWqW32BL733Re0p
	/cm5ACOJ7kdUgaJ/KBx1uwpdy3Dz9WtXelAles6UFqjwZ9zOBcv3GmDz5Vsa5bGV
	libHdQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5d12s8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 19:02:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so242828a91.1
        for <ath12k@lists.infradead.org>; Thu, 03 Sep 2026 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788462170; x=1789066970; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hN1ITePLMNWokGUQxGGCZDTGUrnjtyu3fs7u8SRA+B8=;
        b=dwJto9bt3cFCqaJ4KxKecGz2wtEeKF3waO3jhOPAECWLrgnZnLlE9tp1TVSrs90ZG6
         YB18b3BG/ec8Qx6s2ec8jpm28FQLGNfCXGARpW0K7kQuz1PKCg5aNkv+Y7WEGUHd5NXv
         X7rZnHGK26KC0Q1J6aTm8/cj2ezckVsR0pDCFTz9gA+VOq3iiU7UTQ8O8bioThI4OM/a
         +DVgkfe42Yx/SD/z88qjTd4xeleqCwP1JTfaTzC6n1VVydKAKZXrkibCTfDz305ORvwa
         /AFGxK49z6Qh63mdcMB0hftbDBwwoqfEp1zxjkK68yykjPgvGdVOEnteur7mOJoP2xJd
         qQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788462170; x=1789066970;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hN1ITePLMNWokGUQxGGCZDTGUrnjtyu3fs7u8SRA+B8=;
        b=lnID44EjvJEkfP5G7wDatoHFnfDotDGZhqW3iz3mqKIQF/I/b+WoLJpiI/fUVE+AIh
         ELs0QI0+Nkg3QS/MQEAMmH3etySaxOkottmrfxPgwuC1yhijeKdax/X7tIzNb1OaE7M7
         hzUs8zbgf2ff85J6a9fE4Vppy7xSmMHmysEwx9cF+y/QvhlqzCyRVm8DTsaf3v/o1lUx
         bOuqK+10Iyp5gI1Qmxm3O4mjUFKaYk5Xcr+Ds7RgXaaUvW/OFetKZRF+dt3XfF8uSFnM
         KUEjGbsb0MmdFeRbzK7iek8ByHUXDQJmAXeYjiLaspmvnq6veaCAcsefQo9kxiBGgmW9
         XQgQ==
X-Gm-Message-State: AFuF++mhWl6Go9IHULZP9z9IOvEUlrYyS2OrWAy4+PJos+2FWMYE5qMr
	TnHWtmBNqfyixn2Wm8WpjyS1C7KqBPnnrlpc/Go9XyqC63Xat1Z1fj6mslTbAen4B0OTxqIb3Rz
	00mcoJ/iBZMBzD9QnN/Fr3LZNjj48CpGAGRYhg2IdJW5erWMnOMR9XQAfI4VinqGOYwZEbyg3
X-Gm-Gg: AYBFou1kDKGY4eHB+HdK2I5X+RcuMtem0d2gV34jgLptV3gjJ7dZ9ivXNpvAa2J89og
	ACtln48gapp1AETQJSwcNsrIuADjqpYBJUjzn3MKaDPFZ6SXp3356E/ItdZPdfVL/kUIby/EwPV
	VTmMk2eMk6erMdoirz3b/yWp6D76sJTr4G7LpO1ei+gPVmXYCcqc+p58zDYQzwMHcZP1rD6BK9l
	LUeSh/FwWKMg+MjhBfJ9Kp6AJFmV/qsGuBHpmWanpiRbAdpRQmajNz60vZl8MwzDGGciVapNnTQ
	TxWGJE0I3ewbF+letaZt+4zcNEv1TLVmYGsLw+18i0bjlAJDMhPcGylp3iXB2Ws3uQQDSHBQkXk
	5Jlb/GHZPIQP5Rr534KOBtlIg7TE0wcpbUKKYNOBOQBtiLZkzGmv3dvY=
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr971386a91.1.1788462169638;
        Thu, 03 Sep 2026 12:02:49 -0700 (PDT)
X-Received: by 2002:a17:90b:57d0:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39b260d28eamr971288a91.1.1788462169161;
        Thu, 03 Sep 2026 12:02:49 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243bfbe3sm1230164c88.11.2026.09.03.12.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 12:02:48 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260810174746.3272636-1-vasanthakumar.thiagarajan@oss.qualcomm.com>
References: <20260810174746.3272636-1-vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: update email address for Vasanthakumar
 Thiagarajan
Message-Id: <178846216781.824911.11929590578226228312.b4-ty@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 12:02:47 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX5ezauzwIMrhs
 a13kgsmW4nSPCpks7immZHlzGPXa2vrAHBhg4+L7host33lmDCcpAxTOpresJsBqZ9yALatvcSj
 fPZ3VXSLPvz8vK+89f6ol+a6B+4N5QIQhsqTIPoTHbaxBlMk5NiHppn2WvyOrxoQ5zAXNMjitV4
 X/HEDlfHHFS2rOWb9yMikfy6OS+98ipluYyc3w2SfIU/lc2nbYx8B1EklWinRnJ0s4wFTS/FlZ5
 6jxObvKyqyr5nrsj/N5hIAbrpLVE/4X1BOhMiymw7h1yeq9/gpZhRnz6owKmNF7cSt3HTZbsspP
 18ydTWCrBluJFusTvJTHz/2j3v5t6nglPzV0pexG2z8e9IRs2mJxSiUrPJy3K3dLEZJdpYw7GxE
 S00r5iUd73HNBZ2moZD6xN+v25n+eihanurY4azL3NN+3WQl5EZc1Ctf0ySLR2ukBQbaoKtiawT
 tHolXaV/88ZL3z+vV0A==
X-Proofpoint-ORIG-GUID: 1j0xpaQAazeLoMTto5eZ1BDW4dWZ2sFC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDE2NiBTYWx0ZWRfX1r+d2/IHjM/f
 YjDM6HMKg8GC740ibw7y6EAXm95KMmYJl7mfUP7zL44cRAW5o4JjO69rviyZgD1uCPpJ9T4K6w8
 GCirSFZl+Pg4glzy9zvGvTDC4QchEKY=
X-Proofpoint-GUID: 1j0xpaQAazeLoMTto5eZ1BDW4dWZ2sFC
X-Authority-Analysis: v=2.4 cv=J4GaKgnS c=1 sm=1 tr=0 ts=6a99c45a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kX8_CejQBqqRlIAtXgYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_120250_848328_83E0E25A 
X-CRM114-Status: UNSURE (   8.15  )
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


On Mon, 10 Aug 2026 23:17:46 +0530, Vasanthakumar Thiagarajan wrote:
> Add my current oss email address and map old codeaurora and
> quicinc addresses to it.
> 
> 

Applied, thanks!

[1/1] mailmap: update email address for Vasanthakumar Thiagarajan
      commit: 3cf8fade4b0471db6f28b5ae4c76af1f47883d56

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


