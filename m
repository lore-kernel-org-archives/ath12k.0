Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2579C35FFF
	for <ath12k@archiver.kernel.org>; Wed, 19 Mar 2025 11:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpWWS4rtujK1n/xo8nEaDZVAURyLPCgq6nUafEBKolE=; b=XE3YDeL8+dsbWIgy5hUefvf29h
	TPKkhuSTnlsns9IEWH/WbDetm0ZrCvEE1/T2v76ocSLpJixOgUxO0j2jZWZfAlag30SgFPckpwC8L
	GmUBj9f+rA04z8l0asBsHrbE8d2M+oTGvVqD49Fxe/L4nPTuhMCyEFOadHyYdlIW97/pYWSa+JU88
	hcUmRVVnGgFtsOavkNQGNPmb37+E0Y1xkgCch7lTxHeHUiAyyJVV3qBds8La3TKNNKARofDOxyKNP
	scORv3c1Jy28L6h/zFAhKt0JEnzTmCrR2Wq+0XP95bAjruQ8/9c+VFkn2aUqVG2wWWrUHH4IIMscG
	SJrMpAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turdz-00000008pn8-2b2N
	for ath12k@archiver.kernel.org;
	Wed, 19 Mar 2025 11:31:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turdw-00000008plK-2rRs
	for ath12k@lists.infradead.org;
	Wed, 19 Mar 2025 11:31:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4luBw017200
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KpWWS4rtujK1n/xo8nEaDZVAURyLPCgq6nUafEBKolE=; b=lp0MyyfVfGy8z0YJ
	vL04sg/ByWLmFfW3eDFjBpbnqMvq7Lz3LPhuHyRGy2O82tMBNX1P/szo9vhmCGmD
	LTAqG2Q6oaRMwgCubYd+1In/M5GSo8A+juxjf3WcVl1FcMb4iD+dW+e1MmWtEIDk
	suh+6o6JQI3NpVYMetczxlU+94duPlqi5AlfjoWNRW7lpHVKwIOTDsjJ0EMWEzV8
	nXrCyQ3+sv/Uh6R8tJb2R7DCm6oiS1sCuJkpsDqpNxNfLDmzAIhDcfg+MQMPVE5n
	eP+mwnN21BMMZK27ZGATSEtFSGdsps4kBrItvYQa5Vh3GvLP7b2oi+a2PmKyNPsC
	R9ZE9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1sy3ejh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 11:31:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8feffbe08so177764026d6.0
        for <ath12k@lists.infradead.org>; Wed, 19 Mar 2025 04:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383886; x=1742988686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KpWWS4rtujK1n/xo8nEaDZVAURyLPCgq6nUafEBKolE=;
        b=lRS54ymyX/pC5hDVvpjBF6qQEqaZhuJKpq1lTwEUtDmrgD2C3gqogoVRp0jBowh3e5
         9Z6T+xrKxipa4rheQLpQJqzk6caeC5HPzMcBUUBDRSkXQQuqonksW7HRc2PqMLhNqRoR
         JEtLW3m4PnP3qKMg1QBUEBHDBB8zDmhiakKbtv8yALjbJ+uW277noPVwcN/THwYzwznn
         iE1EYx6yNwfK9k242HG1ygAj7c8UhQg3LE5/vBoS/rLvWYalVFq8+eg0hiF/6J8ZZ+Rz
         8uVwFGtafP2Gxamn/XCRiejJmWCQhc+yD13exvX/PaMw5NtEJSVLKXOG/id/Xlm5LpGj
         SuEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFcSOrI73fGHH7a5BfF0vn9Rk704WQXX5AIvgDj84hoKzXT/GEJ9gdM+naImOXzkfhn1w/clA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCO+yNPCJZng2BVULePE9oCZmlq/fWEay/gVljd92mtlyj/vNP
	16mKogl+aXwoapATVd1Tr4r7PrcDasFkbLcYwfEcKP6LwHcR6GfWbr/Rd4GttRlp41OtzA7wwOE
	FEhbyZ/lGTNdWFKZ0j0T3h94oe2NHCfUeaqxqd/UOuFYNmCSlSAk9uow8IBfp
X-Gm-Gg: ASbGnct7BqYkNf6PmAcWty71zcPQ4E/NBrh44HkdDeWgFFTrSGaqXrHQlpf4FZn6Wvm
	ococXENKblzfbWdPjsDzaEVwMU3qwb2uI9fUSbbujg79vd3WpyUFQIZ27TugzNUtml6kdrQF1ZV
	5WNnn0XB4keHwENSqDcVzfR7nBtbYgUfbd1initH4MEHAa6DXu1F1gWCyY/RYOPeV4wlrA2gVwt
	ET3ndRKkD6v+yaZx92QepGYKiHJW2drwtxcYUD/zkLrEZvsT9z8KgwWEnrThbaXq4DRTEtMfxI5
	sviBH/LXMycvra5paZwbOV317q+dDDF4oGbVFtRgxaZRcP81XSG3QMxTV4CubvznPUyt4ZTnii2
	3brY=
X-Received: by 2002:ad4:5be4:0:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6eb2949600amr32213076d6.39.1742383886268;
        Wed, 19 Mar 2025 04:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7/Y6VInAkBnON3Epc11JfY+SkSvLQjl2R0CfSZ7JEcJWOHWNKrGQiyeneFTelehZyZCM5kA==
X-Received: by 2002:ad4:5be4:0:b0:6e4:2e12:3a0c with SMTP id 6a1803df08f44-6eb2949600amr32212736d6.39.1742383885904;
        Wed, 19 Mar 2025 04:31:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0d270csm22789301fa.8.2025.03.19.04.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:31:25 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:31:23 +0200
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
Message-ID: <xu2gugtf67b46cxn3jnbwgxmukhh7r6bcvsxdodpg7tdecdurk@ct5nk7ohs6xs>
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
X-Proofpoint-GUID: JnaJovKRnzEwWJn_-83HKiqO0pvnSs61
X-Proofpoint-ORIG-GUID: JnaJovKRnzEwWJn_-83HKiqO0pvnSs61
X-Authority-Analysis: v=2.4 cv=XKcwSRhE c=1 sm=1 tr=0 ts=67daab0f cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=fqUNt6dOXZUB1Xd34j0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043128_840973_0D75B6CD 
X-CRM114-Status: GOOD (  26.75  )
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
> 
> > 
> > Generally we only support upstrmea driver + upstream FW.
> 
> In this case, change the driver to only support those exact firmware versions,
> or print a warning in case we try to load a non-mainline-supported firmware.
> 
> But if you did read the commit message, the commit 46d16f7e1d14 is bogus, the
> single_chip_mlo_supp should be set to true to keep the driver behavior prior
> of commit 46d16f7e1d14. It happens to trigger the crash with this firmware,
> but the code behavior was changed by commit 46d16f7e1d14, which should be fixed.

Now to the change itself. I have checked the referened commit. It's
behaviour doesn't match commit message. It tells: "For the WCN7850
family of chipsets, since the event is not supported, assumption is made
that single chip MLO is supported.", however the contents of the commit
doesn't match this. As such, I'd support the patch, it looks corect to
me, despite being used with the non-supported firmware.

> This is the whole point of this patch, fix a regression on the mainline tree
> for existing users.

-- 
With best wishes
Dmitry

