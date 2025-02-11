Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5980C021A6
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 17:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7t13RmOscMfNDi73nleX4EUfoNXKCb4b28tzUu8aPKU=; b=LhsOlJdFG6s8JbsxyCPLPDaIXa
	y623al30lW+x4+jZQLtrRBDyuugWKK3suS8kDO9zbvBbCeTwWB9NRL1q6eQJET1DarKm/fz/wcbEp
	KXdUvDQMSMaBbjNbuMQMa4LL713MPKO3qy66JvKXYH54vSV55ShCrCJVNSRjYwrvnAaYgqzxACQFk
	FAYoIyn0mbspghU/RErBzWfYM8kRTA01n2DoNtH2xleLboHQUTgYTkH/+CST0+h5jXYseFfgUwAR3
	U3ZuLcRY0UvepDRuHo0n3+yv4VFm95DVzrlUlwYJdbS9LDSgGN58TH/76JdsgnB0u3KExiBtQN4TH
	LOfukV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thuHq-00000004if5-2Mwz
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 17:43:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thu7O-00000004h3h-1Qzt
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 17:32:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BAqINk031929
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 17:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7t13RmOscMfNDi73nleX4EUfoNXKCb4b28tzUu8aPKU=; b=EqxbXW9cWWmWZDpK
	KJHTfS4BOz9w1wKyaRz4aAM8il3tM5Wz52S/pYIY3Xb9NNCtCE6vl1VMgkSTrXUw
	J+a62IiCeyKEIl3tCWDuXYJgR9n3WPjRMj2xrp0s/MwZt0nxVe1xzm3PB1sRSE0Y
	f5ypUFOn+PX2Z/SaROlw7CwKU1E9K71vrgo1KxOCiG1QOPE1IFD5v1SKZsWPPR0q
	ZBHr5akx5RiKD/KbYgcXvIv8DHMla3RAmGIUWneM74x0pLDvdQWAtH9VHEei86fG
	cY2he9AwYXRXa7gGtfjgkBkgyErF27pk3v49emaiRQHFeH+J8qWdfnFV+PBwzuaP
	QtPGyQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk4f2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 17:32:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fa6610fe70so5292599a91.1
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 09:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295136; x=1739899936;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7t13RmOscMfNDi73nleX4EUfoNXKCb4b28tzUu8aPKU=;
        b=hHgJndIt8+h++ilGy9PqERrpXaPuavtOirhGfuO8wzU7N7IGOLQJj2rwbS3ZeS2rEW
         FCz4VRJLpPKT/hRlRSUoZ05eo6mt+yVThwZ+57vd+H3fLamwuCjVxiLRuxKea49BOz+0
         XDSQEjxU5b2o6yz6qVbSx8OEGZZAKylSm2il/QVWhpYpLRjmdCBZQ5O5/CNZhntuQOgw
         ZpeFvUfDO7WbmUq6FKDWkFtoroKzKYOgAOQn/Sa2NjhXe7mVanVmFlNEkBuMAiz6MHk5
         yk/mv0E1bqlEhYVGSjWoDROCB5L91b9r9jOb6Ypg/EFOKslXqO+vDxqRRoiAupy7Eis8
         Ct7w==
X-Forwarded-Encrypted: i=1; AJvYcCWXnicXS6hQMHBxTuGz+f6a2LZv1xoNW8AwbNIOeyOupIifnLEwgkdgHQ8Pscf3v63oNUDoHIg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq/fK6cqKQMlOm++ZwEC3uHONLdC92ctQnUzqkra4TUXNQ61qL
	n3cwhHZjQ9Mo7BQw7TWqjg5IZY5VAAzCZ+ks528QA91Ni6OA5lsdbVTdRong4UCX0kad1W5wdMA
	3TcL1/wgKnLpmd+9OrpwoP/wCrMKGLBYrJiiSoXSigHrVZd4vA+PxdmugSwk7
X-Gm-Gg: ASbGnct+nzwm/nrK00w/rzp6RQ/K97bZ27IHF1zhz93eLcSCxGlOLptCRBpxVKrpBvm
	VwinKQNkquZLBjSZ6vaQ3GPAJ+RBzqFQnWh8MD+rARWD4Oa695tqQuiIkgsSmg0HfT0vLs41xtN
	W+6FZZdKPp7VtXyLvw8T9nHvkhtF1gayC7lJzPjDGB6ZaG/2mRbM8KqZli+TwA9NDtxifNrbkm4
	LH5Uil+DtUEJ+5PgoZu+zIXs3+sNrE3JrDVLpxYSuyKNWQFTE/OA7qzczLW56r1K6EkB/P8RyKL
	6kOdG8fWtPoFbh+wRKzroJsoEf9PqXtDRD7cQastGg==
X-Received: by 2002:a17:90b:4d8d:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2fa243ebdbcmr25018187a91.35.1739295135573;
        Tue, 11 Feb 2025 09:32:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF21/tLPL2jpe5F4TcV+Wyh9fwEmWRbfBc0shXo7z6JXXJnQmbq2Yvx8LMK31GkNy5SlgN6Ig==
X-Received: by 2002:a17:90b:4d8d:b0:2ee:693e:ed7a with SMTP id 98e67ed59e1d1-2fa243ebdbcmr25018158a91.35.1739295135224;
        Tue, 11 Feb 2025 09:32:15 -0800 (PST)
Received: from [192.168.29.221] ([49.37.208.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm99816815ad.168.2025.02.11.09.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:32:14 -0800 (PST)
Message-ID: <9f0b4a6e-337e-4370-a2b5-9aed1887d112@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 23:02:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo
 <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UsrMafnm2fVuqIiszpec1eDblThBsFUL
X-Proofpoint-ORIG-GUID: UsrMafnm2fVuqIiszpec1eDblThBsFUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=567 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_093218_389987_066A364E 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

On 2/11/25 08:19, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized*ret* variable to be
> returned in some code paths.
> 
> This explicitly returns 0 without an error. Also removes goto that
> returned*ret* and simply returns in place.
> 
> Closes:https://scan5.scan.coverity.com/#/project-view/63541/10063? 
> selectedIssue=1642337
> Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
> Signed-off-by: Ethan Carter Edwards<ethan@ethancedwards.com>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya

