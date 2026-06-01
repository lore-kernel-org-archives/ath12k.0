Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A41CD6E55
	for <ath12k@archiver.kernel.org>; Mon,  1 Jun 2026 10:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D+h4SeGoGOd+jPM+XZEcJJVnEtYDWfDIj8NINgO62jI=; b=0/IpyILgVLm2begGOz9y7MjfHd
	psG8nm46JOAXNjdT11keEeDZjQYz1+eK1CpdSQ8M/V81zqCImTjNwL7WjPhpyxF0URjC6gq/9HxM4
	sYyiT83fqGVlT9YVB9GkG7mNke0xHJflwpcJzBBQK20ULLlq56lgZOuUwiTD2uOYlOM2k2biaQ65x
	7Vq30/X9DGCNyDN8lr3/6KtlIocQDgtfLoTQsloSON67ktppQFrKCtthmSYFNBc1b6swi8zQlBu0G
	Jr4o5tLd1ZsSHhgMv9ALvQlf8OUFFJTC5RDcdwAgIA3OwzsvXZGfv/utGRWCVEY8DYu87DgMdGdHV
	OzqsWf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0F0-0000000AfQH-1GeI;
	Mon, 01 Jun 2026 10:51:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0Ey-0000000AfPd-0pZa
	for ath12k@lists.infradead.org;
	Mon, 01 Jun 2026 10:51:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518ftt6146670
	for <ath12k@lists.infradead.org>; Mon, 1 Jun 2026 10:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D+h4SeGoGOd+jPM+XZEcJJVnEtYDWfDIj8NINgO62jI=; b=ZvGYOIEiSr1V9fkU
	6bh4GcBfWepiUMiaqidMmTyGB/ItCK+pP6mijmV8bZ7cFNTsX/iZ2wj+8Xak/IOT
	mujdQB0EgxpSa6zOLhq8zzEjoylU2UOqF0w46ILhSS2NOg8lpOxlIQ991LHc3Oh/
	WeJH/UBWh1WfaUuhm8AulpS/h8lrPnVHKt3BVz0q5AOmnKWB7zf3a0B2UUDecmfL
	OQd1rqvaXoKt7SE8n7plwWdWQ+lUKuqMTM1hfV5tC5TBo6M3piZ6DkXxRx1C9o1b
	D4jhCaKjTOy8Wa7/2K1zXVnh3RLt/NameMfBu1ULsKO93lKm9+igBZJkT8FsbvPE
	JnInhg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6strg8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 10:51:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8576bc9254so3248376a12.1
        for <ath12k@lists.infradead.org>; Mon, 01 Jun 2026 03:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780311087; x=1780915887; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+h4SeGoGOd+jPM+XZEcJJVnEtYDWfDIj8NINgO62jI=;
        b=dMUf+yq+Bs6GkjLk0Zw2pcl1e7iXdh7kUn1EEmW37RX9p7HEa8jZl40RcU1tfQRNZ4
         XHJpKPc8QCSo3gLSDX7B5wNAt889HMFE6uoT/F3jNq9iUEYXOV27gbA0yZ+D6k7O+oy/
         6MtYkSvibgX5X/83qatJcjaVO+CsQKtahYb4c0t59mLim6AQUh4J/C4ZldS5wx4R3ucD
         GrU7KqIvx+pi6lZHuLSxFJ0NwyA5JEz+o2T/z6Drsgr9H+7BGu14QNKZQBEKSdavuLx3
         Ra12i1LbTiXxq5kUxJHu7c1pn/Yevobq9DfPiP/fjHbnxGWJybaBIBXCUN4eWX1pwd6V
         PLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780311087; x=1780915887;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+h4SeGoGOd+jPM+XZEcJJVnEtYDWfDIj8NINgO62jI=;
        b=UneXwmkm8LxO7rF8nJdEbSg6HwzBdGDy99qGu8mOIo6bvtUEMzDKh+esb3TCy7elYC
         wMQNGTYMllNJIoTeXK+Zrevm+9RBD0AvEZ7L9p6U/Lrgi6txKpZGomNHFWrB9hP9pPFz
         nqi3MyVCaelW4wjH5KbW28hArK9LBR7py+hgXX29ZVQRi06fFGl9OM/Q9tZ2zjjGbi33
         3nYXr6uwcJoaHXDAJTbrg7jre7HBVWWIdc3z71oiKDQpIf1wPImeMfJDyNYbXQAnp60y
         fLQt1EVMC9vArdWF4Bxnutmt3gZyuLl9A7P/6Kw5UTMOmPED4D4wubynwffcCq0HCCHx
         R/Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/JKu6Ot4CLL4hn7afReia4kQNuMEPoA01nREadiQIR81WlI4Xr4nE2N0OhP7rWvPA1ZWNxb+I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw150Vg8PmIGV7jOtmajminvmm45iasZCq0MjoShrNknKmooDvC
	Ot5y4J1bvEs3Z1/l041SFPGzZ30WDVFR09x5ShlJkwz4wb8vs+GLhvVnKfnqO1Y3Y7zd0IL1nT0
	VrD7fmfi3+AoR1YJPzVfOe9Qj5xrnyqoI2ENLC8AZKVdyqaOKnbP6XQNaXSJVtkKD
X-Gm-Gg: Acq92OHfTEqjPAJ2xw2GyzQ/F+LiIVIyyTwN6TQY85Tk+RM2D2UO62PgPJB1TUpzguu
	2cqXov7zrgiMC0e8lRFIHkzMV80Qfs/j65gmkUgP8IqB7MgvsUd8SNZqgknFa4pAqnWsk5ie3Ra
	Z7tVT+9aZBy6cCsUHHxgQTI/Puocc5G3IpjKIOJErhnJS8dt4V2wV0gRYqpOnBEjD6tSBPfRLKh
	VsYSBIetsA/iVyYDHkwhv/PASQ6dRxcYlW+sboL2ep6QWSNLm8wfh9Bw8d8nv3T7kRkIeoZsif2
	tOrYBJYEqDucWE0XaKbb2SrJNy+4uKpW9YVMnYzhgFPnhKwFh/htMINm9Pl9dTcigC93jTVHG3z
	uSd2vUO1RpJFaTlsjCM2FdQzG7kFTaeEHR6pYxEn2H73jYn9Rmpb3aCe4f5L0mCRTlupYhIsDHZ
	Ily5Qc6L9XS+c0A5YUCOO5MoQDzYpV
X-Received: by 2002:a05:6a21:7105:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3b42809f475mr10855570637.29.1780311086936;
        Mon, 01 Jun 2026 03:51:26 -0700 (PDT)
X-Received: by 2002:a05:6a21:7105:b0:3a2:d838:bfc6 with SMTP id adf61e73a8af0-3b42809f475mr10855549637.29.1780311086485;
        Mon, 01 Jun 2026 03:51:26 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85861d5fe2sm7264726a12.8.2026.06.01.03.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:51:26 -0700 (PDT)
Message-ID: <4bc998d1-30a1-465d-b764-475a0a3e9b51@oss.qualcomm.com>
Date: Mon, 1 Jun 2026 18:51:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent incorrect vif chanctx
 switch when handling multi-radio contexts
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260522091828.3199584-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEwOCBTYWx0ZWRfX+PiKM/coEHno
 yCBg92xUnLHFQJwVyRzCpQRMZEq/novWghOHAHxD6p5PrS5fsBnTyRTLRa8X+o3xGMWss9icVFV
 bmF7SeSduHFmCXa6zxIMJmDKU6GQ4ovzhBPtusGLcs1rn5oySU6tb3nUptlC1bLTEj3HRoSoQva
 Zm3AW/CQeyU53jKFyhH4u0pK6Rndb7c/mN8qo8Ui2R4R+OaSFYYAXs5YmSR9KgrAI4hLYMpWAXA
 niMCOuk8cP2GJT4H3m4ngx4AfzKI1X3hY40+mBIHmWsjkct34/v7JHnkO+S4k8AOH+IfF+VNxok
 zJna75b38TnVCeewSwDXJrn9+ZOGrOTMiWeWH69MpiVbxUY4BHHmy2WHm5X2SGBxMXl5roKavHL
 LVqT1khl38FcMaHeK5pm3TyKtlbT6bC/h4LDDh0wlhZXOyaUFGKbR7H2Q5YeSzGVPyfXiQkzawp
 CpC5XnVGW1gK5y8FRSA==
X-Proofpoint-ORIG-GUID: gpOeLVTBF23FpBP7rtUheFBvhYVH9sWW
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d642f cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=8GVvVDYDP2p1e3aVpqAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: gpOeLVTBF23FpBP7rtUheFBvhYVH9sWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_035128_254296_983B3066 
X-CRM114-Status: GOOD (  13.81  )
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



On 5/22/2026 5:18 PM, Maharaja Kennadyrajan wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> When multiple links switch channel contexts around the same time, mac80211
> may complete CSA for several links together and invoke
> ath12k_mac_op_switch_vif_chanctx() with an array of vifs spanning more than
> one underlying radio in a single-wiphy configuration.
> 
> The driver currently assumes that all entries in the vifs array belong to the
> same radio and derives the radio context from the first element. On multi-radio
> hardware, this can lead to incorrect vdev selection/updates and may corrupt
> driver state when the number of vifs exceeds what a single radio supports.
> 
> Fix this by validating each vif's switch request and then processing vifs
> grouped by their associated radio. For each vif, ensure the band does not
> change across the switch and that both old/new channel contexts resolve to a
> valid ath12k device. Reject attempts to move a vif between radios (not
> supported for now) and return -EOPNOTSUPP to upper layers.
> 
> Then, iterate through the input vifs, collect all unprocessed entries that map
> to the same radio, and invoke ath12k_mac_update_vif_chan() separately for each
> radio group. This removes any reliance on mac80211 providing the array grouped
> by radio or sharing old_ctx pointers across vifs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


