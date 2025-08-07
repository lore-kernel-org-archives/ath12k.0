Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B43C87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxZeQQVAmBavdpLJSCBxurMhVns7iRlr3w0iJRJhDDw=; b=zb4JzpX8JOTCZpzDWn0naaAvUF
	2cc0KTOKtE2JAQtJqRc40g7wt1J9AtRPAkeWUM+02OkPyFBEyz5mqyf0zxD6AGawQRt1HrbuvvpuL
	Kp4SIgOjpS+t5uCo2Fl57oK8+uEQNUD/lbZILVc15j4VnVSCRaTnae9tSGgz66J88ebQaYlX16QMf
	Pu7ZuS/WqjvTK0D2tLp9UlupmpuQHwcGIbFtnO7a1Reqt03UTKupp6DoZj6IP6QLJl+d25M7NOlyS
	IU6u7dVyjrI9Nz3HfvATdn596GsoWjCa1vcgP2he6dKo1nENH1U0DYlmXafnpocOsJ8F1f1KXTmyk
	j7VJ5D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtIc-0000000HJjr-399j;
	Thu, 07 Aug 2025 05:36:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtIa-0000000HJjR-1zoA
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 05:36:21 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5772VNHj003740
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 05:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UxZeQQVAmBavdpLJSCBxurMh
	Vns7iRlr3w0iJRJhDDw=; b=ED7htlSddzgYdLewfK9+dghQeRB9D2fcgN5QpsGR
	7itCFpfsule34dfad4JJ4K6XQOHfQkq2xltTUXrvZPnwFbSF4DF0drY4xKt1UoK2
	H/dkcBBV0uBQqOn2hxkHb8cloOFvHIVZXODYG5BnlK2lwfawPpAk65IZ8+gW4HBx
	IV1wenqR57x1BMujGnfZATPk+SLkF0T2+7CGEUM9Y4MH4l3osJ23YZBd4Eihmmjc
	fPo4AW+xNOW2JwplaUPzHgRvAVwPRbxMxe8n42baslouNkaD0ODlbfwlTSCW9r4B
	6WwVnVqM5NHa7fFKiVeQq2eHqeQk1S/Y4Oj33Y+1byatSA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u22466-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 05:36:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24249098fd0so8112145ad.0
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 22:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754544979; x=1755149779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxZeQQVAmBavdpLJSCBxurMhVns7iRlr3w0iJRJhDDw=;
        b=aU2SQOOXpJZvOLVck/9EAELPKLTRnvEbgc4yiDoisZLq20hX3lIZDyNaHcrkb/QEmO
         HhbYXazavgL8jHkn4bsPzH2O4q5XBvXdsHWtpFxfCckagcSSfA6DEUw0w10D9J6BHrLN
         vtdjy/YsZqBgHAz2e/oCxsn9/gF9XZEA9HM1R29tR3YpMdS8QWa4njoItdcwJnfc4yIY
         txoFQ4P4M62jmDqbnuTDlOGemumT6sKTxYT2FwaoDCSCOyOcLyt4VrgJVh6ysIFXN2M1
         3Z1z8VKwHZeHp8g2aTdi4pvRvYecttJKD99YTYhsMPUbMYFl3obCW5hkVWo0Vzqhbb/6
         gUjg==
X-Forwarded-Encrypted: i=1; AJvYcCWgRtDOK3Xffzjnbozqf808gFsHLwrryqF5UZv/3G3IMwL+2byTn3A2nq/mx46ABN9EA2X7CcM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0sYo9OvMVjYuXdAVp6eryXYMP/30vcXI27Iw4n5ZkP60D0eRz
	w2ws27j5GO++m/ZMdxoggdFQ72CW3c4mKFe/WNKAfxd2FF1ytK8tAdtHuvmxnS8Kw4ueTbcByAO
	aHtWLw0WbSTvDLmWwSHzlKLdNy0FhPy0D7TMRCsv14P8KrBAT2nprK3Pdogqa4VXi
X-Gm-Gg: ASbGncvjEPa/Y4onUiP5lwnrmCNMa2X49/+cWZ6R3hFsfL8S5v8vflIhsPnEWdrZZgG
	LiYFaqb22nYkaQFLz9ffOnVTRCMmavFOPL8NRNeCGBy/kSMnuGvnirmNOTR9XcgKJW8X/+ORoN8
	vNxjWu4zm3HSmcvBv+wmSvJ8D9wuEYdSizeDEjVLtYvyZB5g+C50VVPJtYHbeZyMsCmvnEQNl2T
	AMUdRJLV5HahtKP0M5eaxBDDQUSxedvQPqul27H7Cth7fF/XuydQQvK5rQ5nfSfH8yld+1tm4SP
	mUzW7zUF7tEQf8I2fhNzXpI18AMPwS04ivC3zwD1t5SFtDGuSDUnezgtSe3PBE0+EIQ=
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95522365ad.32.1754544978893;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNnNfGxhuNTArtU5/L07BRaCZPrejbjIclynuCefSVipf8dv9sFPtvjvfNzygxX8GedWQ6Nw==
X-Received: by 2002:a17:902:cecf:b0:240:3dbb:761c with SMTP id d9443c01a7336-2429f6256acmr95521815ad.32.1754544978443;
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89768fcsm175372765ad.82.2025.08.06.22.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 22:36:18 -0700 (PDT)
Date: Thu, 7 Aug 2025 11:06:10 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250807053610.siel2gsvl2igc3ga@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
 <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
X-Proofpoint-GUID: vGrZcX23jlh9dkG4oQAQymf-DtOCZ86v
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=68943b53 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: vGrZcX23jlh9dkG4oQAQymf-DtOCZ86v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX0B34xfWHVark
 jLXSH2oGwrhBUgMh2iZNHphCVwoHZZpHdmfF1Np5euGvsAaWQ/zSX0HM8TppbPek0eq0H1MRdVr
 i09uk4obHzpGn78eFahLsJSlKyk4Xx+IG/fbkrHUdrSC0OTayczqQy28A9ya/U4cEfkA510Ln90
 yOOdcEA1TJXemUbqWQOw12w1h2/Xxx6yOqKYWAtYyrZN8f2fLIymg0UeS1+lhV0a/RYgZCFFNve
 9HYIB3PUjl3LOvZAthb7tTRm8fubP4XfODcWmmbMcsJKT2CdJod9yiYfNoQZtHxuQ8DhjrYAhe7
 ew/IvB2gCxIHHJv8r/d7JMXn2ntL6NMF+rHuy6nAPEQvPe2CVJxupYYfFdFkkQ1RTDQTeVxTzgh
 OomZ+oVG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_223620_518522_E1F70E08 
X-CRM114-Status: GOOD (  18.11  )
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

On Wed, Aug 06, 2025 at 12:07:05PM -0700, Jeff Johnson wrote:
> On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> ...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
> struct firmware *fw,
> >  	if (!mdt_header_valid(fw))
> >  		return -EINVAL;
> >  
> > -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> > +	is_split = qcom_mdt_bins_are_split(fw);
> 
> this should be in the 4/4 patch
> 

Rush to send patches!!

-- 
-Mukesh

