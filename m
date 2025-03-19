Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22EAC35FFA
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 10:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6Y5lGGI4q46cK715gNBMUsF0BQOg3wunktc3lR3ua4=; b=pgoboCtW9KNKOX6W3PHJFl1xR0
	YY7+mRJU5h2T29FprSM+61H2AGkyCVXmFU1J6ut0Gmookfq3A2sIe/CblO9pfYJj1u9dlXK5uKyd1
	WIAkgHBli6N0gaC666YvLd9SRnUyaR3doYnxeFfkjMG50zVuIDYV5eDcu1eVo3OTLvWmCM8Z1dz6g
	hvv1J07nbYE6WG31J7IXmwul5ZcuuWinH3RBq16H0IXxYCP1SM9GsuDQcrZ3YA6Y/NTBCzw0I9wg0
	pgeE6wl5uKRv9gA5JFrmLMA3UX/Jccd/DMGKRILUr7mRy/lGAxNnzBnGwtZVa/nWWXLeyijkzDWts
	SIVIQ91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqVL-00000008dY0-1n1m
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 10:18:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqVJ-00000008dXd-18zy
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 10:18:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4loCn020926
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6Y5lGGI4q46cK715gNBMUsF0BQOg3wunktc3lR3ua4=; b=ELFSXtSyaN/qTi23
	Fhv+k/KK9cS4TjDLtwnfEq24IQj+ATJ8Ow+nWodLirGL44stpHKmmxfu1fx0J8xF
	DFA2hGVmqK09sfW/qpy2dJ6QPJVlqg93fhdEDUL55Vs5LTL8fgaFpi7cQu1oDfvR
	Gys8EC06dIOeD5InvWgvSnl3G2kr9UQJ+uBtNhovEY8cMS2gkOeuqk9JFKurgL+X
	Qb5ptnMfRTST6k7Vc7vXr3qumy62xHXlsr5FCoIhoq3xxh497CBVEzOMu4ETcfk+
	0/8eCDS6ER3+IVnS+By6mtAVMj0DiP/PvuNM2dwAazBS1cpK6l4otHRG4m8dxQA2
	UbP9SA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exxbmvbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 10:18:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8caff3bacso62066066d6.1
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 03:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379507; x=1742984307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6Y5lGGI4q46cK715gNBMUsF0BQOg3wunktc3lR3ua4=;
        b=t3jgP275h2mtbSkRHUsid0VtmDcLQjLhGLQrSKpfLH3r8V2/CMS22YngBWv98NgU9V
         kMtbAseVGCk4GAZ27oW1CE3zGKjy0JTovPdR8J049dxj52vqBPs+62zWYp2bTNb+vhzW
         HFYPe9m/Hj1IVbs+tozoMXTKUIaEFZpMNmNCXjEt+UZY+/PHvWQRb5cvmv8oZeExWXCD
         MYbzEVQldm80aE9hOW+lVAVdEtPBfrqvGETno/wX0v58Z78qcPKXVv/DJGUP5VrYZHnV
         bxcX2EoctqAuOus9tZLZrEwv8Iedhcop4FLgqqEMLlu0PDh/vXpPfqBHhy0Wg+IedxZF
         4I8w==
X-Forwarded-Encrypted: i=1; AJvYcCW6jmMEbvdXgBbDyi7497xZTXOJx56AXqBsI96xUSGE51XR92jPX2nILC3wu6YAzIM+orhfaZ8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTltzi1/Go1QuecMTonNgizIm8+MDexCPY9EM08GNgomuPmiN
	bHU5vuyZQPvjwS6333Sd49CmpHaqm8TB4z3bikkTygHSgHNwpvZeGSSzWKVNuUq2hk6c5KM+A84
	Y2BpZuKDzmpM045ikWjpeJWHn0tmk1ef8nVTa4YkAEllEBCYRU/o+9sF+gsXp
X-Gm-Gg: ASbGncsoRYkxK4ZNKMb+NKBNn5oDItlk0wTstBM8QF440L0e7lFu4AY25hNaPlVGtYt
	0Mm3cXoZeDmdFcQCE4+MAb7PZlAAU0Cla5pBoU1oVjI5KPWNtV4zUqIkYOT6DhnJgWA8LDDcEdk
	0xugXim7ItPcdbLk8/yB790ISxF8l70LV8wyCpkDTONhxYuqnqFeLuR/2oYLSfH83ln7nlHbTnn
	mk52S05fQ9EhuU1iTa9Qk0I3bnVPh3CCUdIm4bELr9x8GU0qc3RhtPrvPBGBZtyECdtT4Ja0TIf
	rqOMhAdR4/BAw7jlh3i1PGEvSkRgegPCpQqfiFuychKyxV8hLooz5VAU5pk2smyFs9JLTxIleXh
	hG34=
X-Received: by 2002:a05:6214:246b:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6eb29394c4bmr29894906d6.21.1742379507124;
        Wed, 19 Mar 2025 03:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqGB3tXFnX9eFbTzML8EPlNjeAQVUX+G6oWctw4G+pdkokTJUMuoaQB1gAhPBzKRoofBi5IA==
X-Received: by 2002:a05:6214:246b:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6eb29394c4bmr29894616d6.21.1742379506730;
        Wed, 19 Mar 2025 03:18:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a8bf7sm1896139e87.223.2025.03.19.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:18:25 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:18:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <6717d816-02b3-4d27-848b-620398808076@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6717d816-02b3-4d27-848b-620398808076@linaro.org>
X-Authority-Analysis: v=2.4 cv=QN1oRhLL c=1 sm=1 tr=0 ts=67da99f4 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Ta77wq_4RykSGFGVYMQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AR9Vd_jLn_YGUCrPpjd_L0Js-yOfhvjX
X-Proofpoint-GUID: AR9Vd_jLn_YGUCrPpjd_L0Js-yOfhvjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_031829_318874_CFA1427D 
X-CRM114-Status: GOOD (  19.18  )
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

On Wed, Mar 19, 2025 at 11:00:34AM +0100, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 19/03/2025 10:46, Baochen Qiang wrote:
> > 
> > 
> > On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> > > Hi,
> > > 
> > > On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> > > > 
> > > > 
> > > > On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> > > > > On 18/03/2025 17:35, Jeff Johnson wrote:
> > > > > > On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> > > > > > > In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> > > > > > > single_chip_mlo_supp")
> > > > > > > the line:
> > > > > > >      ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> > > > > > > was incorrectly updated to:
> > > > > > >      ab->single_chip_mlo_supp = false;
> > > > > > > leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> > > > > > > 
> > > > > > > The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> > > > > > > crashes on driver initialization with:
> > > > > > >    ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> > > > > > >    ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> > > > > > > fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> > > > > > > QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> > 
> > this FW version is not upstream yet, why are you testing with it?
> 
> I was not aware the driver supported only a small subset of firmwares.

Yes, this has been communicated by Kalle (and now by Jeff) for ages:
using any firmware outside of linux-firmware is not supported, unless
you have been explicitly told to use a particular binary. Firmware
coming from the Android / Mobile might use different knobs and have
different expectations regarding driver behaviour.

-- 
With best wishes
Dmitry

