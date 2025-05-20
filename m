Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A36C3ABDD
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 15:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHgqkd6hm8Hq1q7YxMSBDCk/zGJCjVvUs5Iq6IcFe0Y=; b=eQlR9M3TX1yO6h/92JcH1WmX+l
	rfeaE0xsKEvvrNLJ+Mg6PNX3Cw2hTBxkKK5LqDc70ac9eoyCPIOi0hl2cuGmDVJ/peR0hQBrHgSJj
	HeoWZjloB9flWTSzlI8NcRAl/RvHTkKRv0/NXQXZBS1m4H5wiv+T3xzDfBIMf5HpnoOQyGgy5QubX
	V/QGuhT30bweD4ApNyipJJuC1qRMwAmF3UBhPwgvAwapC6c5+6VhpJv4zD6yZz/BV7LEGtqkbSQtU
	J/sZtK9Hwa7pKNENb64/zuI9B41lHdbvupwjG+E3LfVl6czutPURxVEw0EIcfpOGf4agOgTr5yFft
	Tw0YZ3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOYy-0000000DH71-3J5m;
	Tue, 20 May 2025 15:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOTD-0000000DG5E-1iRm
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 15:01:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K73l1k012060
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:01:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bHgqkd6hm8Hq1q7YxMSBDCk/zGJCjVvUs5Iq6IcFe0Y=; b=SZK59fzaoDuENpWv
	EAs4yOswZLDQe2RY8BrUOPSRKBfJ8MVzeiLdobjsijwfDFmccWEpJxeeG1ZhZTKv
	p/BKNCZIINHsnDpczRyB6Zw1vWCpifAPZdWLiUO3iHJnyS7QAIxeLlI9wP67vNEi
	tYLl5EDLcZXN+IVH8Dlp362xhrCQwMu8Uf6q5I6C0tMc2gafnXdVnKilCCDZ5Dy0
	8NPqFf5nfI7aFWKhOpK+NbkKspocwxJJ2bIkhfCNYFGCH8HU8lrYQKrytCBN5R0w
	U9lnthctjtiER4sH1YOTSuwbLsaYzjF20FoGha1epSUj5rYvh9M6NIszUoAq/OcD
	q7AZbw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkra058h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:01:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7401179b06fso4577887b3a.1
        for <ath12k@lists.infradead.org>; Tue, 20 May 2025 08:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753290; x=1748358090;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bHgqkd6hm8Hq1q7YxMSBDCk/zGJCjVvUs5Iq6IcFe0Y=;
        b=OFlfAZnlNzUw/TB7RfjeuEZhHqfI+wVP32uKr23T5SgwpJ85fzIxyfx0RHeRPKaeN9
         zh0a0FJR+V8zwmmla1o2UcWMYv660CTI2JNVKUJKYzoZUyFou8ud8J0PHsqbtA2Mj7LF
         Kg01Jd+24BhXlGjhEaqcuRzMIGq4Gg6Io2UskyiQoxhWFlSFxlSxk6bc8WjFDZCrP0Mt
         XnPqaOjPnXfuXd3rrTvAMWp6Hb+eo8AGXAIoXULq44vP58dzZJAU7B8lIammdH8DrwkT
         oyXeF7urfy6meEfBGs7e7DhgQ0LAyTeyVCbHizJCzjx8JTQutxJIo6Hxmb8EnJy+RKoz
         bfSQ==
X-Gm-Message-State: AOJu0YzdN00f74tEIyxifIpn83rkkUPgwHOJL6++bsDRAG+iTO1Bbu2o
	+qHnYNVCHl9V9EgZqtQXN+dUmZF1trMzVR5niTHye1jbOfl/NHNQf5cGBMHhdjRDEhe7h42JfpT
	RMMGtF72wt4a8yOjQItxKY6DtZqsw9IIYOjJHkSi2z+2uA22/8lM/gs9CMIZWBdUN5qDSnCb8
X-Gm-Gg: ASbGnct3JrhbiBHaFCpl6IEG5t+7bS73AOBwXDccIeTHsBF2sNmeIHyMDRIqDcAbKqE
	sWd2H7/6H6qpEiceEkMFtyWMQiUiUlXOYHC4Qu9a6Hvc2j8u7CZLLcW5uPws4qP5FOCWwZFQzj5
	YweF0E6J/kDyBvLU3TmaWREnKVrx040hZrTWOyVgEDzGIZ98/7CWN3K48uPXGv/f+SnSV70yJwJ
	tfcy6T/raAGO6zQs1TIOPqPeU1Hvdsl1HkITUdySGdqqQB0kmELcXg9t4wLVug//KgmK6pAbAPy
	Ys+iDG8oFlqMafNM1+B4bzn2aFUzjVMmKjRsOxe/svy1B57a
X-Received: by 2002:a05:6a00:2387:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-742a9787178mr25526332b3a.2.1747753284631;
        Tue, 20 May 2025 08:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9RZleP0KFHI4c54jIB6ezn6V6sype+be4dY8lOauCm798mvRiBrtqj7XJhbQ3yCpUKokmow==
X-Received: by 2002:a05:6a00:2387:b0:742:a82b:abeb with SMTP id d2e1a72fcca58-742a9787178mr25526262b3a.2.1747753284023;
        Tue, 20 May 2025 08:01:24 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e2106sm8264258b3a.17.2025.05.20.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:01:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Rajat Soni <quic_rajson@quicinc.com>
Cc: linux-wireless@vger.kernel.org, Aishwarya R <quic_aisr@quicinc.com>
In-Reply-To: <20250505034351.1365914-1-quic_rajson@quicinc.com>
References: <20250505034351.1365914-1-quic_rajson@quicinc.com>
Subject: Re: [PATCH ath-pending v2] wifi: ath12k: remove redundant
 regulatory rules intersection logic in host
Message-Id: <174775328310.1942021.3509552130230492528.b4-ty@oss.qualcomm.com>
Date: Tue, 20 May 2025 08:01:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: v7KuXDAvoFjBYcJ09VREMnpB0wOOR7UN
X-Proofpoint-ORIG-GUID: v7KuXDAvoFjBYcJ09VREMnpB0wOOR7UN
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682c994a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lSjuBxavmJQmSIbZAZEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyMSBTYWx0ZWRfXwC3+ZiPNn6iW
 Crc7uMVO2B+W7nqJPkRJZpAPFvguRKLhz7p4Ks9/TmzvUMxEOGlylGCJxBp7j42JGGGssp6GHcT
 OqpXXbG7T5bPm9jwcKS67GuOFEjl8vRfMrIzACsZu4D9Zm+Jmi2uzdpHfFttXj92Bb68SLE/+vq
 X9fZ5UGoiI814KN/bpM2i4a9pf/p9Iid1PrOYDsvr70sc4OSUq/sosQO19Mf7Wmw/ZvDj4fjBXw
 fZ+fDe5cVmZVXKzwkLWQOWjSN+hdO7QquKpcuwvxQNMcpsZBUhl+LjYStH43Oga7c6edtuwLokx
 gfJmRlbEs0gCFHgKRpzwbASjhzcwZnL0JT87oZ7qihT7dyDUi2jEGK5xsgC7I3asJWTVb9GoNV8
 diZOkpggvihmwJHW2PFysKkOhNFThVw7aBTy17Q7fj13b8XwxA8mT4QZZ9ZT1s1tpN/992od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_080131_455553_1052BB04 
X-CRM114-Status: GOOD (  14.25  )
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


On Mon, 05 May 2025 09:13:51 +0530, Rajat Soni wrote:
> Whenever there is a change in the country code settings from the
> user, driver does an intersection of the regulatory rules for this
> new country with the original regulatory rules which were reported
> during initialization time.
> 
> There is also similar logic running in firmware with a difference
> that the intersection in firmware is only done when the country code
> is configuration during boot up time (BDF/OTP). Firmware logic does
> not kick in when no country code is configured during device bring
> up time as the device is always expected to have the country code
> configured properly in the deployment.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove redundant regulatory rules intersection logic in host
      commit: 1cbc77e0bc32304f574d06c57467914c6168d413

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


