Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FCD60A2601
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NYGhFQBj;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yvrt+def;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkiK0CGr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CcFPXlfDUUCzfPe+7vYJaMORcaT3g3EVwn4pG4ZIhNM=; b=NYGhFQBj14SFdz
	F3TWT+yZHjEKl6dutF600HjBz3sDndY4oJ6wI9C3J3O5CVbPJN9amK8OEZBHvr0aVw94d5NYVbcpk
	+TPKBFtnt/uTcyiCu2Bf92RPQH5efGQg9FEc8AYCc67uOmD5U2grgKvPFTPEcbKzTy8xL1vfKR3l7
	7PT0amj0K9N9lqDsABGWX+6Pj6ZllhBgxdltuUrlBk44LBFgUNSa9++lArxs48jIctaXiEbAuEVUf
	2KItcECYHFiq4DZD30ascmvqVKJC7mMGKZ0FJzGuMWu+A5u1VQS+RlS8yFGH8q4muSvpY4ujAiTbk
	wgJq2KfQdoyQrqybA4YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0y-00000009ea2-434V;
	Wed, 18 Nov 2026 17:00:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj0t-00000009eUe-3gwm
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwLST3925888
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 16:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CcFPXlfDUUCzfPe+7vYJaMORcaT3g3EVwn4pG4ZIhNM=; b=Yvrt+def9RLDlply
	48In55judDmVsHoikcXwVwJJr1DlUhDz3Az5PhGqVZSh7dbCwI1vDVuYnVxDRv0Z
	5mov/dbgS2+/njcslFu4w4XL2Guzkq9a13ZqHxlOYMN3T2zfqWMy1XTywUie4Itd
	8p3Ebo+EjNXp5fHJv7AgPBqc0wNf/VgGUeHKGGFTrjQaRSz8Pup6uNkTbY+2hPtJ
	26+4391FsN3iIxqf5VD6NsoYg9U2icRl2zq/XstPOgDdw5W1smHCIDhgVZu3oWCz
	IA21KNNQe9ULU4q9e/3+grxqhP26GpUx6sL4Ph9oZu2XSEA3M79RcurghnWJWlQY
	/MQkGg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fgg0570-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 16:59:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3afcaadeeso1387c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021193; x=1795625993; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CcFPXlfDUUCzfPe+7vYJaMORcaT3g3EVwn4pG4ZIhNM=;
        b=dkiK0CGrfjlPeWLNdS+RtzXAKquvIFPGu7j+akuAvnsqetg3RY5yFP2k1TD51Qq9Zj
         StXducBQA+xK5xQ/KWOrGGvjmEyGD3pfXOt0p5DbRKXZc5TrSu2klMXkuBlYSf1uk3/z
         g4MjTc0AMLyN5+gT3YSsBq20JJepZvEVfMmKREUHM4fI9Di2V9Z0jmWllS3cjJ6Aj0kG
         2s9eLgkmCxxfhNIXORBgQRagD+kN5X5sH0NxsRnFlNMfXkHCqRjRYVLXRRqxWydc7mHt
         700YgfCmbiLoQcuoLjNjYKq6CwweJKaEIcLAeiPIPrSwb/Lh/ffjf6F/tCoDlDti2E5B
         zPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021193; x=1795625993;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CcFPXlfDUUCzfPe+7vYJaMORcaT3g3EVwn4pG4ZIhNM=;
        b=M1ydCTDe1wggUgEdNBOaHBnZ/wx6JeY8nKP/s2J9oPmqeQ0aG6aMrM/Zb1bL1YNqOA
         VsDRgdO9A2scN3ARm85Phh/lgdGwbCTav0Q2aF1o2E1I4WEO0u1scX/sef3bElmXPiDg
         NsjjcwnbKfzoQ5iQP1Q08+TYJBpusGj4CnMpkODE4LJyUKzaEAJ8i+9iAlu9JxcDGQ4Q
         BucVLgicYzlqm9ROO1xecUoI1Qx4cSl3dsja/RELfYDoDGpRqdH64uxHTM2WuF62qnkj
         7SmP7+pvCRJJ61IwSRbBD3wTNl+XGfF0GW3FS6AOx6qYg0PiHgFQ8u4pojihGFn6SLGP
         kTHQ==
X-Gm-Message-State: APuU4Z/9rSJmLDfkRLghKT33KP8djSCzC3JAx9tX16W0v53t1p/UTLeV
	y7U0r48wiZ5vXwU6v9i7211Oh5kigYji/a5Y+Nnc79B8WEs1vLhj6mL1lKqevekq/HjZXJSpD0K
	52fOGB/lkwYch1uGHFqXo8Qu/ulimKCYT1sEzho9PvEo/oeYGdrOpjqWTXgTVh1orE+LCTH3l
X-Gm-Gg: AYBFou3bJyk9XmuxLzY1fhYy3RiCl9ZPkfqn2JVMVgukpvwwZU5OaMWytCZhPfvsujO
	pvRDVPtKwBNVXRL0SKimFBMpo4AyWzhaEnV83fh7m7BKFXjA0QVVq1OW/LyGYF/C4I41RzBpugv
	4XoqDjscFc53g1bubsbzLEj+cmkkXM58eysg6PSOhJWlkZlwS7bdNj4aElKtwKT49jAQZVky/ds
	Ab4XA6KqGRIZhyccPO2bQ2PUcXJVj4zh3UZGR6qVpFoMACPlE02D2+xucEeiO0vONBwSbxkHKSH
	e0/nnavJB1D+saZN4RTInbGnrhVCBleZeJdnGwoLms2TFGS3cn726LLyob2ooVt7PjU4y+8yYO6
	RidrWAwcqja0A3EeUI26FtzhJgCrs2msl/YrQzehdE1APTk/CF54SwasCpbiP1XPA4sTdu8QMLy
	gTAA4fb/B5TbdDSpNK+gIXG6cwCqKd
X-Received: by 2002:a05:701b:2810:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b54cba3948mr31928c88.19.1795021192796;
        Wed, 18 Nov 2026 08:59:52 -0800 (PST)
X-Received: by 2002:a05:701b:2810:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b54cba3948mr31595c88.19.1795021178002;
        Wed, 18 Nov 2026 08:59:38 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:37 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
In-Reply-To: <20261118023020.2845578-1-jie.zhang@oss.qualcomm.com>
References: <20261118023020.2845578-1-jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: add entry for Jie Zhang
Message-Id: <179502117726.3425953.4666627055429917566.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:37 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-GUID: lb7l_xc_j2uhd06rSYgIfBpmvLGSSB5h
X-Proofpoint-ORIG-GUID: lb7l_xc_j2uhd06rSYgIfBpmvLGSSB5h
X-Authority-Analysis: v=2.4 cv=fOSsTpae c=1 sm=1 tr=0 ts=6afdd98e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aYgzH1ta9VOUaYCxY5AA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX+WHKIKTjQ6er
 vpQqRMVEAtXdrsbPTa9sYh38HqneJizBnqj7brn+HuwI5Tavy7fMy5qeY6r2IiEI0DVI2Gh1iL7
 yFeFWSTc+XBW4REs9GPY1Ek/yeV3SDA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX6WAzpduPFE/C
 T7Z1hZZlizLOIRFpQD4+NppbhRg5Q2rCuBsRBX9/1US15p32uJV1pxJ8+v7KlVAAIOwJ8Ab4qzS
 nizVS9cukiO/35wTu5lCK5BimrOGucF6yPNjt/mU5Ml/uCI3ATm23lF1TM+qBRT99TTqZNpICeh
 BtfdmeSJUdDJBoUSJ1Ih9aerdO5khZTUcZCKokage3A7sFZeb7hI2Biym29CHKaaK+h0lkp86X9
 YaynpaiqNBifWoK0SzqKl+pvTsmXgrVjsi4LWlk6jct8oSjwZyvLVeW+7sXxrK6yl6uXX3F/zIP
 lp/qIszDRZfjOTR6K4N1pM6z7K0v+DvrTQGD2vUWncabpCKRlPS0XBPZME7dJNE3tP1vj+95NtO
 ZOBbYjM7bXnccJhzh2iS4dETxc8l1G9ohOGqSoU+ZBBDnmyctYcFtiYDCmM/thrv7mDxHTuP627
 xTqORbJmnf5LROqYWkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090004_105009_71446FC1 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Wed, 18 Nov 2026 10:30:20 +0800, Jie Zhang wrote:
> Add .mailmap entry to map the historical quic_jiezh@quicinc.com
> address to the current jie.zhang@oss.qualcomm.com address.

Applied, thanks!

[1/1] mailmap: add entry for Jie Zhang
      commit: 47c09d08ee369d718e8e199e118925bed112b9b2

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


