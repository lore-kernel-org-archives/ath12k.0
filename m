Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92BA5C61DD3
	for <ath12k@archiver.kernel.org>; Mon, 31 Aug 2026 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=; b=U0RkKprks9yuqd79GaKUfKXmtu
	DAFCKVwc9K5jcISfh3cC/TWK3duua7gWNZUUouTulLw1cB6HVSDSWcsgNB9f3CuewkG1XO7D++8gM
	aOG+Qlcd4G7BC8kzn9KCsAePM346H9fYmLJDf4yD4QyBVayCbdc7vtwFKZQAHZz/RETZmrUbl7Kw0
	+Nk143/kshCRjoTnJT7qhC/J0TtaTR6LhOjRgcYaog7kAOJFTZDc8llwysWMxwN0VATj6T9vuFhwi
	JxYgV6pLx8/vCPu5meTEVhNQLBaUB1Knd8y7UmVN6iaggNZOzJB7gDiVEGqI+QEI9of8m+Cg+d1r3
	tgvkkq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174i-0000000AJVH-3u3c;
	Mon, 31 Aug 2026 18:49:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x174e-0000000AJT4-1762
	for ath12k@lists.infradead.org;
	Mon, 31 Aug 2026 18:49:43 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYHlq257977
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHW3hkiKEKh+3lY2MSqr0
	2obqLy+h9PcFgQfJDAbMA=; b=YoaCRXvPl7KaDCHPA/qHOt0UcWyYenPzyXi8Wc
	3y8z5ARu+VNYlcdCpPy8xMrMYnaN6gDHEjv0WmHOLNn3SVPKb1cCR+yxf2Tjukeb
	PiW8D0hAAt6N4rGCenhd4KPwNv0YpG3jB1o5BLLse8Qjh5z8QdUWvyQufvGhUpga
	o67WBhKyTeMAtr08pMHLrpapkNGyf+aqyHEMjlhzw+CsVrtPJdKvKn9o0LRsBZMJ
	BJcYap+dSdswlDeyJ4SaaVyxpDRnPK5CmuQgbyjNf5fFWJi1OzVhuzTjc4WlrR5w
	uDruHSUnefLr/vp+SLCBa4eenRgTAMetInoVof5ARSskZSOw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rbakub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 18:49:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-381250979d5so128051a91.0
        for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 11:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788202178; x=1788806978; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=FhfDAdgcHXETWGU11dPpeltb/1Uqb7FCdsRSaEiUmNyIHkh0YBAIECgEJt9HSj46tK
         AwoB9AxEZC/0+EkF0OVscsD4MsEGpbKiMPZSzjEqPjKDNSwSGcbtGRMFvaV24mFvOZ4m
         oS1KSt+k8CxtA7KeaMGH6f5g+O3nJjbqWk2GfO7M9vHvOZleZCn7Lc8mNShh0q6mTc9Y
         VR+VlZ7PTAc31R0EuGKJKwZVvcst2fb8r4ROojK+OaSTzPyblu6u8mWvNzSFk8VAoAjV
         dGlfae8CfKDJUr5eSJAzMBCzNfWv5bWeHUENSE2RepR1+7BnP70Of1W8KzLlRVmJc0hm
         cdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202178; x=1788806978;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZHW3hkiKEKh+3lY2MSqr02obqLy+h9PcFgQfJDAbMA=;
        b=EB1WyNB7j41HSPhQ+nzTSmTetoqU/i/CZstVw3cFbniSWKJw0auSKgjs9snKk1XqwE
         HU3UHVO017U4JApqNgk2l1r2eYaZY4xeKtrLrz9Cn3ZG2jUQJ0ZKvHhG2MgjIOoMvA/a
         GRjdPOMgiFyGsz/DilKkgyN+uOgME8UIHHMPi3n/e63tm5c5/kbOGa7apO06gTcgt7hH
         Dw42yYVNvqIBDZzSFdCikrPAInVMxHBjOzdEDnNyLkLIlJg/ZDNwxQEWxKpMIoiKbSAY
         rG71hDiOz+25dGlPCfKz+5TxFTvdwyDi3HnibJkmrU3165TvLk2ZivijfUnVdjMheeE6
         VT7w==
X-Forwarded-Encrypted: i=1; AKwUvBz6gztJ7ivVvDDcAxHpOET7SHL3FVD5950pynKn+5SpULwOvFmgJPuGm5nDlm3IQolM1M45sj4=@lists.infradead.org
X-Gm-Message-State: AFuF++loyQpEsonfQWC1wMJ/XRNKXKOR4n9gGKb3ejeoOqlMtCGd9M3r
	zffgKpFaYU1U+pqc1zLc+ekWej4W+rPglafEeNZQxyV4kbebg6aNVTOG2zGL+CXvRfpsSshGZiH
	SClyyCUwh+Gme2ZIVDMUMsOKu5AItAbyfQGGkDpEbR2y5L7yw1ceFuCFZhDlinZGMHX/gOLLU
X-Gm-Gg: AYBFou1e55Yi//mNLmHifF55I1JjiNPSfjNvNwZ9Z8Ium4BgthycejfP6ys+nCrRPUB
	sOCnX8DG9dDOsfrAwHGdyyGJGV129sAGHGdffilBrJt84jm/jcubE5XDzFb1rWBnLe5UdsYwzj2
	fEAEZ1QFl76CBBTlDuo0C7Uk4Sxgi/B364W2OHEpmk2V+8GVrhtqsh1ZGt85LwA4+EAItAGe3kL
	CMTge8PAJqC4eQTW6lW3vyyCvPzpyw+2E9Wv2zSd+bTlvMKPzFD41P4j+HmDtn4P2Du0BNs3FZC
	wG14iLHYImaP6yiFXsZ6EwH0AcbbQibd1Kac11OQCbuoo5wzeXK40owEKuydw4Lmdurdpb/fyGj
	e70nx1PPrEs5ELvZln/B3cPMJSxaZ1mdvlIpn
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742489a91.11.1788202177906;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-396d0f2f709mr43742416a91.11.1788202177338;
        Mon, 31 Aug 2026 11:49:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm44942268c88.0.2026.08.31.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 11:49:36 -0700 (PDT)
Message-ID: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260831
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: V_8Q-qcUeR8ePcxIWIZYepfWM0TEVbxO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfX6t2QXlSuxZzg
 TKvF1yTVeZPVc+T2OhmDkBqMgcmiWhnLacnlQLzG1WN3WI5AQD41M+CERA3d7BGm91RnL2BTkmW
 PS9IlhUh66sOVOShnVVOb+I/KCDg4l0quPSXdIIf2I7U+4LABK04O+yLfl2OfbQgzwa6slQU8Ym
 dPM3Ha0fNw05PfIPY20Oi2Z/8n3ziC5JMxjK0MhXRY9AbE/diHTtEWDucIGpDMnfY4x9bgYtFeI
 2SyWksftr+vGQT470cciD+gzHpkQQ7ipeXidrIRA5KP+zzQdE4T9YBqVncPfSNN0IzvgQFAMNSP
 PnVdanqScOrkf3frBKqtc1zJYLkJg5/GLmp155zN4dWks7Hyd1llQGgLhuS0dxtB9nqB5eXHKan
 Cvi3lPh/306e5Xhw4ucNNo0YWRBj47YJly2dHYB98767JYkJceweJvqIdKfQCFpsbKL6nrar1/J
 AHjVMXBRoiI/qCCNxlA==
X-Proofpoint-GUID: V_8Q-qcUeR8ePcxIWIZYepfWM0TEVbxO
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE2MiBTYWx0ZWRfXyPX8JVJTLDvO
 OrrTxRlEVidIBNxdZiH/gXjAEGIQP8N8DFkWOi5NNlw7K/U0fdZ0pbmDKgHCbQRpCVEWKppLD/j
 DtMixllGXDX2IjyCKqgvzYam9vPRe2c=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95ccc2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_114940_324572_94FC130B 
X-CRM114-Status: GOOD (  10.36  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
This version enables Multi-link Operation (MLO).

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e981caea6ed33c48d25b7dbf473327dbd01df163:

  Merge branch 'inf43455' into 'main' (2026-08-31 12:35:31 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260831

for you to fetch changes up to 59005d7898134a2898c5a17f37a9f629a3bc6807:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1 (2026-08-31 11:44:42 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7148724 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

