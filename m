Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FF2C53200
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=; b=bQuiIaGmWFuuemvV1qjFYb4iXo
	lCbMDl4Mdi+SR4SZYltdw3AHXj5F8Zz7W9+eiUs2eLjVQ1G2l1Z2JTKJxlVF2bPB3CyDgKEVtmKiE
	/CSzllTcW/nkRLMM0HPTHJ1gOIWrSr2JP6kSh9Vm6sgmi0e/ltqj2KnRuWgPyY1+28m12PreElVlL
	DNGrRjXWtJMipZY7gt7ZOOqUQQkCVuJsd5++DMGRoNBJBEsP8FzmK7EdWw4T5jp2Td/B8TRR03WB/
	L2ftpyucWBrgt6gFu4p5DtPe3utx/kveZqL53o/VwI3pHqBHX9nWI1ZjA4mIVUA9rIaLhJnqkVGPY
	yxcHwwTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6la-00000008UMb-2jS2;
	Wed, 29 Jul 2026 16:04:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6lY-00000008ULS-1Qii
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 16:04:21 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TG3MhD2247527
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 16:04:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=; b=ZBtQiihhJvqK/79a
	pmymVMmL9BEOo5WjQ8K/EWHzIu+8qVyJHDsdSbLnyx5XD+lczdGDAkmziUVg3oCt
	H/1YCqR333iYJLF/esBLOrq75SUgCdcmA+JT3vA3z+z7ScOKMdLz0z71mLRAvCuP
	iDLtMbTZjiDgElowa8aljWHmrA5aPuBVNbBs/lhNiU8/DgYLTxVyIqkF92nx266h
	JwQHsBwhC8KC/R+Ky8i1F8BksTN6v1hgPR27Gn7CVhehXwHcIoKYnmhO9grKSvpr
	0P83+HpDDB/e7wpakjFmfJfeJ6CqPptRhD9LRZiyd8x9E7b8mnxsoY2bLsmaJF+H
	6IrLSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqmpyg0ag-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 16:04:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf2308ef97so1888955ad.0
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 09:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785341058; cv=none;
        d=google.com; s=arc-20260327;
        b=XgWV8g2NvJrnYkBvcbcxWPd3Qya3Wfe5DTbjPhlDWfQETA+3JePTuqBGPilH6y9xhG
         uTUwULx1ji0s2zwthUlAfD/DdrXLqf1LJIcGsUqKi/IjPMMd+ilP8C8wf4VBNjvNyOxs
         55jB/yCgylQFRzXIT0a9ncgd8Ed47StCDyYUglmdTVpb+9Dzm2zweFlUAQ+hIxR5S9Jj
         JrOYjqkppAOZ01PimEdfSWHrd4/gtsQb/kML25WGSYnYgSqTii3QcfkLg0iFIgJRtcfH
         ZKhByG8TVyhDTE9cKDhkmHeYhvhwETNaFnsfyJ2cOu9hUFXyt8LCFyHbY2VFskoiYdrK
         0Nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        fh=azFQN3WGg+d5rpEY0bXLk019ahzfKRi2zZZCBlE9r4I=;
        b=CwXyw/G6qA2kUt1DLXPSbDkqlMepf59HUKcA4tdFZyZwZ1NgqWPow+gec5EGKjN8dv
         gZPMfc0c8uFdnjTPm7bcmjsN0isSBIrWJusRU9sxy9Tpdm2LYFI+TIwDOcSQ/sD1T/av
         /iFStplGWsh18TZhdPV3l31l8dZ6UKOHiDVzi7Sj+h36eh/vAvXlx/8fJN2+HnQby9o1
         8KsKoiUxqMz2B/0E0p1wcqlOI35I5RqJ2uZGgrmZ/XfbIiYHM/x+gvcJ0vRMvs5OiZy8
         U9Y03ttE8ZDBXV8BaImuHXYgjIjF8U4b7BAZxFlTUYmwxXZdDdsTwyPMiKToeLU4kXgG
         ZG6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785341058; x=1785945858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        b=UrnERjMlZSUdD0dzr09RXlIsZvwtjJ5Wnu7K8F76nk/o++LliHrbJPE06xe6rS9Li6
         P+07hr9SrldCqeQsodLUlBdmKbVS63Vp0HZ5fxb+cWoBFQnf0CtX0SBuaD9VIPOYc22T
         H2FfQdINTQwKE6oFQS006BFyxgNEH2BXiEaw6PzbAZ3FjkRkS9y7C/VoLD8sDw3Ggy01
         7KnIzodFKM1MXKTh19fpacag1CDtej7dEoXCq8LszczyavsJiyyY9nnWKcF+Xvd7EalC
         5OOQ8t0rIOSW2adfwMy83BGoCvBF3Vq5WG8Nnx3AEtg7SZL+yVBHWninkzRCS6aiX7J7
         qQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341058; x=1785945858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+YirpcoPBY4rpOhTrO4fkmB31Gsil9/d9ea67eHUJDk=;
        b=hNM5Kq59d7ncNoGAz99umr1M7g9Lm7U2w+wTlW/hQDgCJP22S5UqK0YoFtGH9L3k7W
         t+xIKO+PDH2m84gzLEw9JV2VbSSxHF+XTpQskZAUH/4cKilKhXRd50noJu6j8LUklRT2
         X7N3d+96vYxywyHJtRBCPX/M9kQzU9XqUT78maMaR43BH/uZvNwzfmHMEJapEud5llcV
         +4wd+/9iF4Hbi4Ab7Vu397sZ6Il+hDyr0Za1OmS0ha7GXnuPsTxiuHPOodWqWFj3tyDV
         8A6pRMbZa0Xn/PkYE0jiBTIQTJ4vHYb0mX41S/G8Ab6I1PalwP6F1cNaUpe2yDZLBXZz
         XA2A==
X-Forwarded-Encrypted: i=1; AHgh+RqRFMPHNXHo/h5qOn4BQQdXnVDp3yuVknoMhsHnUGu6Sp+CsiCQt/N94gFyspl1jYhFl1PgQBM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy69gLilcfVrp+9+hV6DZuYOFNlzZNLIA7QSS1m9H1cLkXQulNK
	dlaXlESmycPeVuMnJV/xTVuDXClZd/So3v5dJ2+yMaVPc3ysQvl+q2QfeY5PkIVkJcxpOg1aMk9
	GYmUnxGKYDBsehSLs8Ru9Y5RtSvFpypZkRbQEuS7B+DTqWY+M+yt644lGDEqPnYHldrfxlEqz7R
	C7KUr7NsZ1hLpoexlA5He3lBr5/oQQv0bD7bp9JSI=
X-Gm-Gg: AR+sD13Zvr8esQWb22miEiEybvjkA1F5i5kuKm+ILZUaBA5K1mrhR6p1yFTwavFpH6f
	QRLa3AbI/BRX6eRgzUg/FqnlAONEt6/LB+lIINBzh+sRALkpHO203DVhiMLw1yEsgZnjBTu5OU6
	2KXSOa5Z/lOuVBfUf5T8cr2wak1KDStvpiLTr4IoSvHGXDyAcakl8C4uwc62K7nL5jTUZSv1nTO
	BuZyLCm2+56m+loCg==
X-Received: by 2002:a17:902:f608:b0:2cf:ca85:57e2 with SMTP id d9443c01a7336-2d01e9b3e33mr79701915ad.1.1785341058406;
        Wed, 29 Jul 2026 09:04:18 -0700 (PDT)
X-Received: by 2002:a17:902:f608:b0:2cf:ca85:57e2 with SMTP id
 d9443c01a7336-2d01e9b3e33mr79701215ad.1.1785341057790; Wed, 29 Jul 2026
 09:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <CABkEBKaZOEh4OrZTYfFOj8QZHY8Ruxn2rcXL-axWHwK4o6MECA@mail.gmail.com>
 <20260724094226.227200-1-jtornosm@redhat.com>
In-Reply-To: <20260724094226.227200-1-jtornosm@redhat.com>
From: Tamizh Raja <tamizh.raja@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:34:04 +0530
X-Gm-Features: AUfX_mzOcu8W2M6mZ5O9sk34pCttGj9TQPlUjWdGWOfgGovyIkDqWdRVlqu4fPo
Message-ID: <CABkEBKZ7+Z=DL5scE7LnFQz==c3JKoUfFgfDYRf5HoLS_=fr=g@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PYrPQChd c=1 sm=1 tr=0 ts=6a6a2483 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=20KFwNOVAAAA:8 a=fWcgDiPmc55ChaNYinEA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: hlNtGw_7r87-gVHOk12LfYLC1I8fz-4Z
X-Proofpoint-GUID: hlNtGw_7r87-gVHOk12LfYLC1I8fz-4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXwpDEg8Si8Kz9
 IuQp6n7Rw8dgDNNRNKXLH2JLdLveWCi/LByxXQU4ColGkjLc6Nc6pexRM4/8+zSNIGN0CUGOCEn
 YI/MDU/AiBcECPJBdeCK1BPDuvYmTdQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNyBTYWx0ZWRfXyFK9fca2sOT6
 k6gengAlxUxFE9JfDYApWUSkJRgnXFxv0g4dPeHW5/jnJyzX9BCBfPk9Z75NfM+4DRRN91VjfjX
 faBB1/CviD3s6ObkgDzMfN2suUWJMXafrhFnDSWl/aGsQMmGk35xIs+kFqy/4AJg3/96P13y2uI
 Xz4MjZK5+PeuaR8gm06RpDSauVOLf8naCFc+43kC+dvkFEmDKzX7BRUff33UL9dO/MYjTmJcrLE
 0N+WBrw3zq6W0JpkufSAUAtMwAwov0agbHkFSE6mbKZLeukj9ETDSjcxsqRRoI5C3D3w1kQI1wM
 u07XCDcbafylcHck/mhiBUXMxbkWqbUFmFPQ743COr2CWEnSRz/1vwy8GbpD6bTdRukHC5BZvAc
 svCUWF+OrUOHKb3m2IJlogSw8v1XvwtT6T9+odngeKUDdehTncReMBMst+3U+l9abvz6dvQh88P
 F+22qrGL6b9GLe8WJPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_090420_387564_404B38DB 
X-CRM114-Status: GOOD (  10.80  )
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

On Fri, Jul 24, 2026 at 3:12=E2=80=AFPM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> Hello Tamizh,
>
> This is the same mapping already used by WCN7850 via skb_get_queue_mappin=
g().
> The patch only aligns WCN6750 with that existing approach.
>
Sure thanks for the information. Do we have throughput values with this cha=
nge?




--=20
- Tamizh.

