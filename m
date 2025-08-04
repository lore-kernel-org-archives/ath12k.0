Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87206C87FD1
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV10ozYgUe4tzTx22lApIwGpt095dJ2LaBUIJh0zJQw=; b=Uevgr0xdRap3aXhl58ATnOVU3i
	jA9YvBm/rL2hwTOoL89H48VCbcbjNqc3eGc+EhDZmlGrz58cxgRUAIaWFJ0Eo+pNWBy5RGAN+hD1J
	CO2dPaV84rahThtaYHfImAEtyDvUp3xxyhV4KD6qR3a6PUy3yWczcV6dP1rhjYyTrQpbE3XTyj6rl
	4AjLovksp9yUmsjj61v9Qoy+8F9t5QKxgPiIRM3bmYm9g/We060xhgIe6rE4a7F5mIeF9rZeR23C+
	xg+xArDu5HztDtCUfJ8756wxJTvzS+q48BHOUyeQTREAkDluuypGapEUV/9EKFWM1mcZx5dJlMm6M
	XbNT0+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwf8-0000000AjLB-1EDM;
	Mon, 04 Aug 2025 14:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw0r-0000000Adzy-3EOU
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 14:18:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574E1gvF015986
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 14:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yV10ozYgUe4tzTx22lApIwGp
	t095dJ2LaBUIJh0zJQw=; b=RMp4iUAdZ9MiaxFspe846207a/m9KYLu8rIGQKjJ
	qB4vNnU8PaDP1Ad933PHN0PyrgvOI0fhe2SGeJ77pV9WJgEDfyRM1Ae4aDn7aWNf
	IArKKl93H++Hq7ONRD+H4cj1YfYK67jEveI1tDzu0H3ULUuMenzm0QKUmIhAfn78
	eP/TJ68EYRxJALyFI17JPBWUmbN/MiaxK8jEF1ZMT/gakSrO37rUX60yFUKn3OWA
	BXG9d0aoFqfMM+IqudbsaqHxRQycBnRzuVyfkbun6/f9EN7LiFNusGcsS9E5lwp8
	vgrmuF45J5XPyfxVbmtZycCTKPTarVb1uTQOK3ybKwJnTg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a555f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 14:18:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76bf8e79828so2958992b3a.3
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 07:18:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317084; x=1754921884;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yV10ozYgUe4tzTx22lApIwGpt095dJ2LaBUIJh0zJQw=;
        b=eH9WMH1xgsTendXozRnfyxd9DSIDKAw1D4zfEn9HyVEwAa/vGksJGb4HvhlSuneIpm
         2aCRlK7g6iGQZEZQY18RcuOvR09SmuOW1+HPJGZtGvDwXAk+Tl/EdxkA5cGF7SBOBDEH
         qg1H+jmHbvvp96EnA0rxLylKGY8wegbs67/BayyvIVhYBErzmPMpwpG26uh06YOabcaY
         l9G8wXAlblA1hY4dS3G0M7B/t4EiMYct8dZ3Hh3XHfXbmx47y1k0iabWtVvPysjUEu3Z
         eMi1S+uWCN4g19W6pMWeT38yxeZQvpjOzg5X6JmGuos/Ng8e8Ks/p/9p1Nthv/NpwjZd
         dcZw==
X-Forwarded-Encrypted: i=1; AJvYcCUDLL8un6BIrq5jjUC3mae+C/akXlCe+UjG4sVT+/CLHsY6lIi6zwbIMkclVZvxLIO5fk62BHs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8uhg/sKMS2cvbApbvMucRvBd8lLz+iWvkskCxJJw+CTmSaojX
	EhZtMhev21NC8BKHQT6n5c509VRmaw/iPF3vTZsRcKLoHiGZqOWA8z00i6/cFraSVGYVktxI/9b
	cqb5jXsHjXue2LWPEINdYL+BoxG8U/bkIna7J8wN/7D90nkcAiRHodu3o82Ul2yrc
X-Gm-Gg: ASbGncsqNclchLRgdAdRwaFRreO91qSYwv/YNth1A2jQ6KBdlUjBmwTSFTjYqQahVuW
	9ul8EiJgTq/vH8QyHc4qvQPpA8GY/9NOZUW0DCSBL4S9lIxY9b5nY0RPhVuA+vOY9O57lT4vz+W
	dAbFyaaNJ/2bGCkSUtegTYgbu6NtRHe2Ymqoh82QMD1C90HCslVYIvrnqPiHtS2P8oZ/ATLhZp4
	TdLIg1vTXV2KZQ1UXc/epLAorpKuSe/jT/kQCvAgYqOUPETWi9w/HAIpGqX6zKNJiNSNrejjith
	i+ufXnn5J8m8gPbqHrWmyX3RH0RPCFCSh/epSpF+ZndN0vOE555bECWv39FaxMMFIDg=
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615988b3a.17.1754317083687;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGDsTzlLGqDnAvh3MpUA8PVpt35YKMpiCWpzipsOhlEqGhm5w5CMVTLOTYyI4L20glEIYSNg==
X-Received: by 2002:a05:6a00:744f:b0:76b:f06f:3bdf with SMTP id d2e1a72fcca58-76bf06f4064mr9615955b3a.17.1754317083308;
        Mon, 04 Aug 2025 07:18:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bea205365sm6411378b3a.83.2025.08.04.07.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 07:18:02 -0700 (PDT)
Date: Mon, 4 Aug 2025 19:47:55 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
Message-ID: <20250804141755.qzwfgqjdx3s6yc7q@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
 <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=6890c11c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6krb5mtG3PrLwc7-ycAA:9
 a=CjuIK1q_8ugA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: FHbwiffNCe00R6mCpybbvNQglWnkkYOu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3OSBTYWx0ZWRfX2iwKfyvBKTxg
 BC6wBjcz9kS9RjPuo4HNnr1XLCuNR8Id6f0OI/914TdOSvHgA9msJzoqhinVaF8xvG2LLUH3yvR
 jrbEi5OEpgbURWzlAb96Y/YO+LzF+/SYCtP5a+okuwB2XeZ52jEc4DqpcksDBoxDArPUShobPOn
 RLSXIhfr4XduqjjJcy33TGUDyQj+R8uhmu+ncBliQSRdNjUfp0t1DX7OM5Pidbqr6EVUldgpRHf
 kkIuux2kNmeSt5GM7J7/V6xEdjOwNQVEt9I2JM+7dNa378ZD1hEgBd1jFL3SSL12D6J8G44oahV
 gpPKEaG001qwoUoFFprQA0f+EhpN7NeSK/vDyAJuJBbVJJEc68XOHRLf+oeLr8jY28NtMRUMK5q
 R9aMysyswF1/U71LRXYZlYjQOEkAqG8xmoIJWHIdMW6duPKK0p7OBXmIpKDlQr5QXfH1njdz
X-Proofpoint-GUID: FHbwiffNCe00R6mCpybbvNQglWnkkYOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_06,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_071805_925611_0AAFC37C 
X-CRM114-Status: GOOD (  15.62  )
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

On Mon, Aug 04, 2025 at 03:16:35PM +0200, Konrad Dybcio wrote:
> On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> > pas id is not used in qcom_mdt_load_no_init() and it should not
> > be used as it is non-PAS specific function and has no relation
> > to PAS specific mechanism.
> > 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> > +static bool qcom_mdt_bins_are_split(const struct firmware *fw)
> 
> This seems unrelated (or at least unmentioned)

Ah, Missed it.
I will keep this as separate change.

-Mukesh
> 
> Konrad

