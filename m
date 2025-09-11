Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A772CAC583
	for <ath12k@archiver.kernel.org>; Thu, 11 Sep 2025 06:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ci7qdgBgyJe2UrIMic/tfFkGEGSNKG+ubpPEQWyZHM=; b=Buv356HHtn1nBaxfJeYTR4Gbrn
	0xcitZ2FAT8vJKDqK4H9GQz/AMXSo/zgWWZXZ3agQZsEl58zgh6+dmd1Z5jIgE1x+34dLVmwZSeSy
	8HY3JPntvmb+/YebFPgIbVmsnNW6ly/5+mH/Ju+dBuT5SyG5ccOyB8HIXqG8RHxSQROetQlxF8pgC
	53T4vZXebCJA34+4FP2kWfASD8b2WGzS6nsAy2hzLm/7OnynpTDskxltHk8NWeg2A8Uv/DV+VugZp
	T4vJ5+5ABJCvXUSQRgNCf7W9wnX/ypOVOxUYbFtl79lphp8+zaHqsD32q4SPuhVTOz8wTqHoc0RQ3
	8vkCf8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwawY-00000001Hyb-1KJm;
	Thu, 11 Sep 2025 06:38:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwawV-00000001HxO-1WHC
	for ath12k@lists.infradead.org;
	Thu, 11 Sep 2025 06:38:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2Ieq7002479
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 06:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ci7qdgBgyJe2UrIMic/tfFkGEGSNKG+ubpPEQWyZHM=; b=lo2+8zD2VX/KtPDI
	3/TwZPbw/yo8wLNKaUSjlZ10dhFJU0ZPILb5kIaQKg5/pxJS6TMiH+0T2sgyy03f
	LxMi/q8yoUJYYh2rKCLN6MEEfm5nIcdQMRRPUSHtaobN2B19qy+Tfm/URZGM4X3r
	9eP6Uburb/gYpkxMz4l37lBZdCKJDQksSRfptoUkIuWy+iiZ4wvuajlFRfP5Y+7O
	d+JQYv/gwthORY292jpMOG6yerVrYlb74dYirMVdXWghh3R7nyY0BkpG2pVkOsJ4
	cF5ZSU1F4A/93y9L00vDp+OiP+16HrNn7BrxW4P/GJnnrSEIy/6zfq93d1vVc8h4
	X5Dyjw==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsepp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 11 Sep 2025 06:38:02 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3f65be4978cso3897365ab.0
        for <ath12k@lists.infradead.org>; Wed, 10 Sep 2025 23:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572682; x=1758177482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ci7qdgBgyJe2UrIMic/tfFkGEGSNKG+ubpPEQWyZHM=;
        b=GMWYfPYBcuLkoHHI6Ta1mm2wt8Us9qIZdtbUsOKfniSFp+wCNdEDjpAT7biWiCL1Kd
         hl8D9UoqdWts8nHdMdiAB50A1crUW/9HR6NWSGRLWepdIMedc9ks36PvGqX/iAuGJIM3
         Z4zuRqfQZCOxmIn81R0vOQFLfR9n/e8TNHr8vHhH6wQEAOx6mmPI1sbffAXJVnr0id+g
         9lwrDaSp7IKsyWxEjYblTNzPCnBfjdXA4+WtMOeyKLzp67HMxXVWo0DQNEGCbj2sV8HU
         BVAEzn0U61hfITqLHOWn8F3peUiidZWa6GkFXuaIerJf/4f91wH9uespBqRj1A13+DWt
         2fpA==
X-Forwarded-Encrypted: i=1; AJvYcCVfHrYWnZoEW3PoL0lCjsRP7QmTyrsRZI73QZgBBfPVAFoLrWbUmJ9Y5uIqO/Ut1F5t+90kqt4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5SQqUAqPuMn5xd3PgpbvTRpHE1TbWZbGguGHof/z1bVdzujse
	5aYfPh5nCiATQuDHvYx1r/TNvKCmflmBSQkSq2oBSaMFcfQrTDen9ddKV00yrnFCHw0wQLEHaxy
	iHgJhYdnJPt+gd+8ez7m5IHZcpzrHhHw2Che/U7JJcXlqtUPWje6YRwZt+iAR/ROTeV26XRWboE
	eJBKfY//N0C9DkbQMfwCvAZaI92JgrnmslrrupzaY=
X-Gm-Gg: ASbGnct05zr4LkzowV0K6ANhKoOWj+daBumQbzww0fNTfXZ1S0FI8CF+WHSHcXkRIVS
	wJXbwnRf+vfIWR3hI2dPQ0+nz2NJKffP8qX1Vk8S2GAMkP7Yp3aI9pVbwJXFv3z7i8y43iJ404V
	Jlm/IdYfvYVdw8W6aEdH40/l0=
X-Received: by 2002:a05:6e02:168e:b0:41e:dc1e:614b with SMTP id e9e14a558f8ab-41edc1e6343mr1944165ab.32.1757572681961;
        Wed, 10 Sep 2025 23:38:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNQMuDJYbAL6ndhm9/R6Y/BaEQWZJLcWR2UZFy83OOZ43MdUyMwAG1L9l9rOEit0F8e7FJhTXFSy5+Y9gPgSw=
X-Received: by 2002:a05:6e02:168e:b0:41e:dc1e:614b with SMTP id
 e9e14a558f8ab-41edc1e6343mr1944015ab.32.1757572681580; Wed, 10 Sep 2025
 23:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250905124800.1448493-1-nithyanantham.paramasivam@oss.qualcomm.com>
 <a83d883d0f251c08de7dfe7f2b3e7ab890a9b1df.camel@sipsolutions.net>
In-Reply-To: <a83d883d0f251c08de7dfe7f2b3e7ab890a9b1df.camel@sipsolutions.net>
From: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 12:07:49 +0530
X-Gm-Features: Ac12FXy2GrT9fRzERQC9dkcIjCpesCHOqWl2h2s18c-1tkRkF5-LzmEB2VFrFnQ
Message-ID: <CAD1Z1JJqgVdXHiggeBuQvqwOSHzrzuYZRw3khey9v3oy+xN5pw@mail.gmail.com>
Subject: Re: [PATCH wireless] wifi: cfg80211: Fix "no buffer space available"
 error in nl80211_get_station() for MLO
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Njq-FR5j7-oyOBPxl_B5yhkE3O4ZV2TC
X-Proofpoint-GUID: Njq-FR5j7-oyOBPxl_B5yhkE3O4ZV2TC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1Iy3cMEpV3L7
 X/uAxQWOFqwxrMyc2tt2gA/aPOoRRaZrMC+aBu2mp2pFAX6rwxKOPjv3v+ZeY4ST9I/nDAcgFN4
 e1B45oJWJyuJgAgEHHTVf4rN8DLRXIza1sHtwuL61w8ioHzZBAXmXfajsdefF9qOcYe4i1Bxfng
 DdPIUZ/8helSoTyrbhAB+PzU7kpys3WSOOe4+4fV0+jvlYhuUfFw2KReX1Wj08leUAZ0f9HHzEj
 8vBrdhdlfC6/Jcrc2+ZmNbsjU9DzjLweucvB4U8MlED0CVuH/9dm/QIvlrqAAr4rBe1/RwQ0blk
 /O/B3MXuBsfoFOghkWNQF+nm35hfpFY83SFU6SvDGJLvu92vV/Cl3gzm/LFuH7auyTeyu+iOhC/
 1g11h/Ci
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c26e4a cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=kD4sTvn9sZURAWMP:21 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=stkexhm8AAAA:8 a=1P4ObLHyvds7FFSy6CMA:9 a=QEXdDO2ut3YA:10
 a=HaQ4K6lYObfyUnnIi04v:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_233803_411578_5EC95718 
X-CRM114-Status: GOOD (  24.46  )
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

Hi Johannes,

I agree with your thoughts.

From what I observed, a large sk_buff around 32 KB is allocated and
passed to nl80211_dump_station(). However, this buffer size isn=E2=80=99t
sufficient to accommodate all 16 links(max) when full station
statistics are included.

I also agree that splitting the dump per link within a station is a
good approach. I=E2=80=99ll explore this further and come back.

Thanks again for the feedback.

Best regards,
Nithy



On Wed, Sep 10, 2025 at 2:04=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
>
> On Fri, 2025-09-05 at 18:18 +0530, Nithyanantham Paramasivam wrote:
> > Currently, nl80211_get_station() allocates a fixed buffer size using
> > NLMSG_DEFAULT_SIZE. In multi-link scenarios - particularly when the
> > number of links exceeds two - this buffer size is often insufficient
> > to accommodate complete station statistics, resulting in "no buffer
> > space available" errors.
> >
> > To address this, modify nl80211_get_station() to return only
> > accumulated station statistics and exclude per link stats.
> >
> > Pass a new flag (link_stats) to nl80211_send_station() to control
> > the inclusion of per link statistics. This allows retaining
> > detailed output with per link data in dump commands, while
> > excluding it from other commands where it is not needed.
>
> I guess I'll apply the patch for now since it makes things _better_, but
> I'm really not convinced that it's actually sufficient, and I'm very
> tempted to throw in another patch to make it always false for 6.17.
> Convince me not to? I'll reason below:
>
> It seems to me that with many links, even for dump you could easily need
> more space than the size available for a single dump message just like
> with get, since there's no fundamental difference between the two. So it
> seems to me that not only should it be opt-in from userspace to retrieve
> the data during dump, but also there should be the ability to split the
> dump not only on a per-STA basis but also per-link within the STA, which
> requires some logic adjustments on both sides (hence the opt-in.)
>
> Especially if we start seeing more links and/or more data for each link,
> this will otherwise become an issue even in dumps.
>
> johannes

